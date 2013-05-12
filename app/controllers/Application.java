package controllers;


import models.Booking;
import models.Hotel;
import models.User;
import org.springframework.beans.factory.annotation.Autowired;
import play.data.*;
import static play.data.Form.*;
import play.db.jpa.Transactional;
import play.mvc.*;

import services.BookingService;
import services.JpaBookingService;
import views.html.*;

import java.util.List;

@org.springframework.stereotype.Controller
public class Application extends Controller {


    public static class Login {

        public String username;
        public String password;

        public String validate() {
            if (User.authenticate(username, password) == null) {
                return "Invalid user or password";
            }
            return null;
        }
    }
    
    //@Autowired
    private BookingService bookingService=new JpaBookingService();

    public Result index() {
        return ok(index.render());
    }
    
    public Result search() {
        return ok(search.render(form(SearchCriteria.class)));
    }
    
    @Transactional(readOnly = true)
    public Result hotels() {
        Form<SearchCriteria> scForm = form(SearchCriteria.class).bindFromRequest();
        if (scForm.hasErrors()) {
            return badRequest(search.render(scForm)); 
        } else {      
            SearchCriteria sc = scForm.get();
            List<Hotel> hotels = bookingService.findHotels(sc);
            return ok(searchResult.render(hotels, sc));
        }
    }
    
    @Transactional(readOnly = true)
    public Result show(Long id) {
        Hotel hotel = bookingService.findHotelById(id);
        return ok(show.render(hotel));
    }
    
    @Transactional
    public Result createBooking(Long hotelId) {
        String username=session().get("username");
        Booking booking = bookingService.createBooking(hotelId, username);
        Form<Booking> form = form(Booking.class).fill(booking);
        return ok(enterBookingDetais.render(form, booking));
    }
  
    public Result login() {
        return ok(login.render(form(Login.class)));
    }
    
    @Transactional(readOnly = true)
    public Result authenticate () {
        Form<Login> loginForm = form(Login.class).bindFromRequest();
        if (loginForm.hasErrors()) {
            return badRequest(login.render(loginForm));
        }
        session().clear();        
        session("username", loginForm.get().username);
        return redirect(routes.Application.index());
    }

    public Result logout() {
        session().clear();
        flash("success", "You've been logged out");
        return redirect(
                routes.Application.index()
        );
    }
}
