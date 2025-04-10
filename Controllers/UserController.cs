using System;
using System.Linq;
using System.Web.Http;

namespace Railway_Reservation_New.Controllers
{
    [RoutePrefix("api/User")]
    public class UserController : ApiController
    {
        private RailwayReservationEntities db = new RailwayReservationEntities();

        // POST: api/User/Register
        [HttpPost]
        [Route("Register")]
        public IHttpActionResult Register(
            int user_id,
            string name,
            string email,
            string phone,
            string password,
            string gender,
            int age,
            string address)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
                return BadRequest("Email and password are required.");

            var existingUser = db.Users.FirstOrDefault(u => u.email == email);
            if (existingUser != null)
                return BadRequest("User with this email already exists.");

            User newUser = new User
            {
                user_id = user_id,
                name = name,
                email = email,
                phone = phone,
                password_hash = password,
                gender = gender,
                age = age,
                address = address,
                role = "Passenger",
                created_at = DateTime.Now
            };

            db.Users.Add(newUser);
            db.SaveChanges();

            // ✅ Send email after successful registration
            EmailService.SendEmail(newUser.email, "Welcome to Railway Reservation",
            $"Hi {newUser.name},\n\nYour registration was successful!\nHappy traveling 🚆\n\nRegards,\nRailway Reservation Team");

            return Ok(new { message = "Registration successful!", userId = newUser.user_id });
        }

        // POST: api/User/Login
        [HttpPost]
        [Route("Login")]
        public IHttpActionResult Login(string email, string password)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
                return BadRequest("Email and password are required.");

            var user = db.Users.FirstOrDefault(u => u.email == email && u.password_hash == password);
            if (user == null)
                return Unauthorized();

            // ✅ Send email on successful login
            EmailService.SendEmail(user.email, "Login Successful - Railway Reservation",
            $"Hi {user.name},\n\nYou have successfully logged in on {DateTime.Now}.\n\nIf this wasn’t you, please contact support.\n\nRegards,\nRailway Team");

            return Ok(new
            {
                message = "Login successful!",
                user.user_id,
                user.name,
                user.email,
                user.role
            });
        }

        // GET: api/User/5
        [HttpGet]
        [Route("{id:int}")]
        public IHttpActionResult GetUserById(int id)
        {
            var user = db.Users.FirstOrDefault(u => u.user_id == id);
            if (user == null)
                return NotFound();

            return Ok(user);
        }

        // PUT: api/User/Update
        [HttpPut]
        [Route("Update")]
        public IHttpActionResult UpdateUser(int user_id, string name, string phone, string address, int age)
        {
            var user = db.Users.FirstOrDefault(u => u.user_id == user_id);
            if (user == null)
                return NotFound();

            user.name = name;
            user.phone = phone;
            user.address = address;
            user.age = age;

            db.SaveChanges();

            return Ok(new { message = "User updated successfully." });
        }

        // DELETE: api/User/Delete/5
        [HttpDelete]
        [Route("Delete/{id:int}")]
        public IHttpActionResult DeleteUser(int id)
        {
            var user = db.Users.FirstOrDefault(u => u.user_id == id);
            if (user == null)
                return NotFound();

            // ✅ Email before deleting
            EmailService.SendEmail(user.email, "Account Deleted - Railway Reservation",
            $"Hi {user.name},\n\nYour Railway Reservation account has been deleted.\n\nThank you for using our service.\n\nRegards,\nRailway Team");

            db.Users.Remove(user);
            db.SaveChanges();

            return Ok(new { message = "User deleted successfully." });
        }
    }
}
