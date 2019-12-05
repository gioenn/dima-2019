package it.polimi.deib.deepse.movies.remote;


import it.polimi.deib.deepse.movies.model.Movie;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface MovieRESTInterface {


    @GET("/?")
    Call<Movie> getMovie(@Query("i") String imdbId,
                         @Query("apiKey") String apiKey);

}
