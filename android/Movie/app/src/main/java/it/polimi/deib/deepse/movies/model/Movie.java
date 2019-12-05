package it.polimi.deib.deepse.movies.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.List;

public class Movie {

    @SerializedName("imdbID")
    @Expose
    private String imdbId;

    @SerializedName("Title")
    @Expose
    private String title;

    @SerializedName("Director")
    @Expose
    private String directorName;

    @SerializedName("Year")
    @Expose
    private String year;

    private float userRating;
    private String userReview;

    public Movie(String title, String director) {
        this.title = title;
        this.directorName = director;
    }

    public Movie(String id, float userRating, String userReview) {
        this.imdbId = id;
        this.userRating = userRating;
        this.userReview = userReview;
    }

    public String getImdbId() {
        return imdbId;
    }

    public void setImdbId(String imdbId) {
        this.imdbId = imdbId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDirector() {
        return directorName;
    }

    public void setDirector(String director) {
        this.directorName = director;
    }

    public float getUserRating() {
        return userRating;
    }

    public void setUserRating(float userRating) {
        this.userRating = userRating;
    }

    public String getUserReview() {
        return userReview;
    }

    public void setUserReview(String userReview) {
        this.userReview = userReview;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    @Override
    public String toString() {
        return title + " by " + directorName;
    }

    public static List<Movie> getMovies() {

        List<Movie> movies = new ArrayList<Movie>();

        movies.add(new Movie("Mulholland Drive", "David Lynch"));
        movies.add(new Movie("Interstellar", "Christopher Nolan"));
        movies.add(new Movie("Kill Bill", "Quentin Tarantino"));
        movies.add(new Movie("The Texas Chain Saw Massacre", "Tobe Hooper"));
        movies.add(new Movie("Videodrome", "David Cronemberg"));
        movies.add(new Movie("My Neighbor Totoro", "Hayao Miyazaki"));
        movies.add(new Movie("Scream", "Wes Craven"));
        movies.add(new Movie("Vertigo", "Alfred Hitchcock"));
        movies.add(new Movie("No Country For Old Men", "Joel and Ethan Coen"));
        movies.add(new Movie("Carrie", "Brian De Palma"));
        movies.add(new Movie("Rosemary's Baby", "Roman Polanski"));

        return movies;

    }

}