﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Railway_Reservation_New.Controllers
{
    [RoutePrefix("api/TrainSearch")]
    public class TrainSearchController : ApiController
    {
        private RailwayReservationEntities db = new RailwayReservationEntities();

        // GET: api/TrainSearch/Search?trainId=101&stationName=Pune&journeyDate=2025-04-10
        [HttpGet]
        [Route("Search")]
        public IHttpActionResult GetTrainSchedule(int? trainId = null, string stationName = null, DateTime? journeyDate = null)
        {
            var query = db.Train_Schedules.AsQueryable();

            if (trainId.HasValue)
            {
                query = query.Where(t => t.train_id == trainId.Value);
            }

            if (!string.IsNullOrEmpty(stationName))
            {
                query = query.Where(t => t.Station.station_name.Contains(stationName));
            }

            if (journeyDate.HasValue)
            {
                query = query.Where(t => t.journey_date == journeyDate.Value);
            }

            var result = query
                .OrderBy(t => t.journey_date)
                .ThenBy(t => t.Train.train_name)
                .ThenBy(t => t.stop_number)
                .Select(t => new
                {
                    TrainName = t.Train.train_name,
                    TrainType = t.Train.train_type,
                    StationName = t.Station.station_name,
                    ArrivalTime = t.arrival_time,
                    DepartureTime = t.departure_time,
                    StopNumber = t.stop_number,
                    JourneyDate = t.journey_date
                })
                .ToList();

            if (result.Count == 0)
                return NotFound();

            return Ok(result);
        }
    }
}
