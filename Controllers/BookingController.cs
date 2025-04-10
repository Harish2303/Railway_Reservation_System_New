using System;
using System.Linq;
using System.Web.Http;

namespace Railway_Reservation_New.Controllers
{
    [RoutePrefix("api/Booking")]
    public class BookingController : ApiController
    {
        private RailwayReservationEntities db = new RailwayReservationEntities();

        // POST: api/Booking/AutoReserve
        [HttpPost]
        [Route("AutoReserve")]
        public IHttpActionResult AutoReserve(
            int user_id,
            string from_station_name,
            string to_station_name,
            DateTime journey_date,
            int number_of_passengers)
        {
            var user = db.Users.FirstOrDefault(u => u.user_id == user_id);
            if (user == null)
                return BadRequest("User not found.");

            var fromStation = db.Stations.FirstOrDefault(s => s.station_name == from_station_name);
            var toStation = db.Stations.FirstOrDefault(s => s.station_name == to_station_name);
            if (fromStation == null || toStation == null)
                return BadRequest("Invalid station name(s).");

            var schedules = db.Train_Schedules
                .Where(s => s.journey_date == journey_date)
                .ToList();

            var validTrains = schedules
                .GroupBy(s => s.train_id)
                .Where(g =>
                    g.Any(s => s.station_id == fromStation.station_id) &&
                    g.Any(s => s.station_id == toStation.station_id) &&
                    g.First(s => s.station_id == fromStation.station_id).stop_number <
                    g.First(s => s.station_id == toStation.station_id).stop_number
                )
                .Select(g => new
                {
                    TrainId = g.Key,
                    FromSchedule = g.First(s => s.station_id == fromStation.station_id),
                    ToSchedule = g.First(s => s.station_id == toStation.station_id)
                })
                .FirstOrDefault();

            if (validTrains == null)
                return BadRequest("No valid train found between these stations on selected date.");

            var train = db.Trains.FirstOrDefault(t => t.train_id == validTrains.TrainId);
            var schedule_id = validTrains.FromSchedule.schedule_id;

            var availableSeat = (from coach in db.Coaches
                                 join seat in db.Seats on coach.coach_id equals seat.coach_id
                                 where coach.train_id == train.train_id
                                 && seat.status == "Available"
                                 && !db.Reservations.Any(r => r.seat_id == seat.seat_id && r.schedule_id == schedule_id)
                                 select seat).FirstOrDefault();

            if (availableSeat == null)
                return BadRequest("No available seat found.");

            string pnr = "PNR" + new Random().Next(100000, 999999);

            Reservation reservation = new Reservation
            {
                reservation_id = GetNextReservationId(),
                user_id = user.user_id,
                schedule_id = schedule_id,
                seat_id = availableSeat.seat_id,
                pnr_number = pnr,
                number_of_passengers = number_of_passengers,
                total_fare = (decimal)(train.base_fare ?? 0) * number_of_passengers,
                status = "Confirmed",
                booked_at = DateTime.Now
            };

            db.Reservations.Add(reservation);
            db.SaveChanges();

            // ✅ Send Email
            EmailService.SendEmail(user.email, "Booking Confirmed - Railway Reservation",
            $"Hi {user.name},\n\nYour booking for '{train.train_name}' on {journey_date:yyyy-MM-dd} is confirmed.\nYour PNR: {pnr}.\n\nHave a safe journey!\n\nRegards,\nRailway Team");

            return Ok(new
            {
                message = "Reservation successful!",
                user = user.name,
                age = user.age,
                train = train.train_name,
                pnr = reservation.pnr_number,
                from = from_station_name,
                to = to_station_name,
                journey_date = journey_date.ToString("yyyy-MM-dd")
            });
        }

        private int GetNextReservationId()
        {
            return db.Reservations.Any() ? db.Reservations.Max(r => r.reservation_id) + 1 : 1;
        }
    }
}
