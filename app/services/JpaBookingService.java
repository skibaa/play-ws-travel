package services;

import controllers.SearchCriteria;
import models.Booking;
import models.Hotel;
import models.User;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import play.api.libs.Codecs;
import play.db.jpa.*;
import play.libs.Crypto;

import java.util.List;

/**
 * A JPA-based implementation of the Booking Service. Delegates to a JPA entity
 * manager to issue data access calls against the backing repository. The
 * EntityManager reference is provided by the managing container (Spring)
 * automatically.
 */
@Service("bookingService")
@Repository
public class JpaBookingService implements BookingService {

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Booking> findBookings(String username) {
		if (username != null) {
			return JPA.em()
					.createQuery(
                            "select b from Booking b where b.user.username = :username order by b.checkinDate")
					.setParameter("username", username).getResultList();
		} else {
			return null;
		}
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Hotel> findHotels(SearchCriteria criteria) {
		String pattern = getSearchPattern(criteria);
		return JPA.em().createQuery(
                "select h from Hotel h where lower(h.name) like " + pattern
                        + " or lower(h.city) like " + pattern
                        + " or lower(h.zip) like " + pattern
                        + " or lower(h.address) like " + pattern)
				.setMaxResults(criteria.getPageSize()).setFirstResult(
						criteria.getPage() * criteria.getPageSize())
				.getResultList();
	}

	@Transactional(readOnly = true)
	public Hotel findHotelById(Long id) {
		return JPA.em().find(Hotel.class, id);
	}

	@Transactional(readOnly = true)
	public Booking createBooking(Long hotelId, String username) {
		Hotel hotel = JPA.em().find(Hotel.class, hotelId);
		User user = findUser(username);
		Booking booking = new Booking(hotel, user);
        JPA.em().persist(booking);
		return booking;
	}

	@Transactional
	public void cancelBooking(Long id) {
		Booking booking = JPA.em().find(Booking.class, id);
		if (booking != null) {
            JPA.em().remove(booking);
		}
	}

	// helpers

	private String getSearchPattern(SearchCriteria criteria) {
		if (StringUtils.hasText(criteria.getSearchString())) {
			return "'%"
					+ criteria.getSearchString().toLowerCase()
							.replace('*', '%') + "%'";
		} else {
			return "'%'";
		}
	}

    @Transactional(readOnly = true)
	public User findUser(String username) {
		return (User) JPA.em().createQuery(
                "select u from User u where u.username = :username")
				.setParameter("username", username).getSingleResult();
	}

}