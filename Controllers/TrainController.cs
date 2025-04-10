using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Railway_Reservation_New.Controllers
{
    [RoutePrefix("api/Train")]
    public class TrainController : ApiController
    {
        private RailwayReservationEntities db = new RailwayReservationEntities();

        // GET: api/Train
        [HttpGet]
        [Route("")]
        public IHttpActionResult GetAllTrains()
        {
            var trains = db.Trains
                .Select(t => new
                {
                    t.train_id,
                    t.train_name,
                    t.train_type,
                    t.start_station_id,
                    t.end_station_id,
                    t.base_fare
                })
                .ToList();

            return Ok(trains);
        }

        // GET: api/Train/101
        [HttpGet]
        [Route("{id:int}")]
        public IHttpActionResult GetTrainById(int id)
        {
            var train = db.Trains
                .Where(t => t.train_id == id)
                .Select(t => new
                {
                    t.train_id,
                    t.train_name,
                    t.train_type,
                    t.start_station_id,
                    t.end_station_id,
                    t.base_fare
                })
                .FirstOrDefault();

            if (train == null)
                return NotFound();

            return Ok(train);
        }
    }
}
