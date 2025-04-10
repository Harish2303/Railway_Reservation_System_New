using System;
using System.Linq;
using System.Web.Http;
using System.Data.Entity;

namespace Railway_Reservation_New.Controllers
{
    [RoutePrefix("api/Cancel")]
    public class CancellationController : ApiController
    {
        private RailwayReservationEntities db = new RailwayReservationEntities();

        // POST: api/Cancel/ByPNR
        [HttpPost]
        [Route("ByPNR")]
        public IHttpActionResult CancelByPNR(int user_id, string pnr_number)
        {
            var reservation = db.Reservations
                .Include(r => r.User)
                .Include(r => r.Train_Schedules)
                .FirstOrDefault(r => r.user_id == user_id && r.pnr_number == pnr_number);

            if (reservation == null)
                return BadRequest("No matching reservation found.");

            if (reservation.status == "Canceled")
                return BadRequest("This reservation is already canceled.");

            decimal totalFare = reservation.total_fare ?? 0;
            decimal cancellationCharges = totalFare * 0.1M;
            decimal refundAmount = totalFare - cancellationCharges;

            Cancellation cancel = new Cancellation
            {
                cancellation_id = GetNextCancellationId(),
                reservation_id = reservation.reservation_id,
                cancellation_date = DateTime.Now,
                cancellation_charges = cancellationCharges,
                refund_amount = refundAmount
            };

            db.Cancellations.Add(cancel);
            reservation.status = "Canceled";
            db.SaveChanges();

            // ✅ Send Email
            EmailService.SendEmail(reservation.User.email, "Booking Canceled - Railway Reservation",
            $"Hi {reservation.User.name},\n\nYour reservation with PNR {pnr_number} has been canceled.\nRefund: ₹{refundAmount}\n\nWe hope to serve you again.\n\nRegards,\nRailway Team");

            return Ok(new
            {
                message = $"Reservation with PNR {pnr_number} has been canceled.",
                refund = refundAmount
            });
        }

        private int GetNextCancellationId()
        {
            return db.Cancellations.Any() ? db.Cancellations.Max(c => c.cancellation_id) + 1 : 1;
        }
    }
}
