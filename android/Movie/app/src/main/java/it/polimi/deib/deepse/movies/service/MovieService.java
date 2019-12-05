package it.polimi.deib.deepse.movies.service;

import android.content.Context;
import android.content.res.TypedArray;

import java.util.List;

import it.polimi.deib.deepse.movies.R;
import it.polimi.deib.deepse.movies.data.MovieDBRepository;
import it.polimi.deib.deepse.movies.model.Movie;
import it.polimi.deib.deepse.movies.remote.MovieRESTInterface;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MovieService {

    private static MovieService instance;

    private MovieDBRepository repository;
    private MovieRESTInterface restInterface;

    private MovieService(Context context){
        repository = new MovieDBRepository(context);
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://www.omdbapi.com")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        restInterface =
                retrofit.create(MovieRESTInterface.class);

        fillWithDefault(context);
    }

    public static synchronized MovieService getInstance(Context context){
        if (instance == null)
            instance = new MovieService(context);
        return instance;
    }

    public void getAllMovies(final Callback callback){

    }

    public void fillWithDefault(Context context){
        if (repository.findAll().getCount() != 0)
            return;

        TypedArray moviesIds = context.getResources()
                .obtainTypedArray(R.array.movies_imdb_ids);
        TypedArray moviesRatings = context.getResources()
                .obtainTypedArray(R.array.movies_user_ratings);
        TypedArray moviesReviews = context.getResources()
                .obtainTypedArray(R.array.movies_user_reviews);

        for (int i = 0; i < moviesIds.length(); i++){
            Movie movie = new Movie(moviesIds.getString(i),
                    moviesRatings.getFloat(i, 0.0f),
                    moviesReviews.getString(i));
            repository.add(movie);
        }
    }

    public static interface Callback {
        public void onLoad(List<Movie> movies);
    }

}
