﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Railway_Reservation_New.Controllers
{
    public class TestController : ApiController
    {
        [HttpGet]
        [Route("api/test/hello")]
        public IHttpActionResult Hello()
        {
            return Ok("Hello Swagger!");
        }
    }
}
