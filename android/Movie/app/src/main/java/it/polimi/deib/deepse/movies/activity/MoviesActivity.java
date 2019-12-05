package it.polimi.deib.deepse.movies.activity;

import android.content.res.TypedArray;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

import it.polimi.deib.deepse.movies.R;
import it.polimi.deib.deepse.movies.adapter.MovieArrayAdapter;
import it.polimi.deib.deepse.movies.model.Movie;
import it.polimi.deib.deepse.movies.remote.MovieRESTInterface;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MoviesActivity extends AppCompatActivity {

    List<Movie> movies = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_movies);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });


        retrieveMovies();

    }

    private void retrieveMovies(){

        final TypedArray movieIds =
                getResources().obtainTypedArray(R.array.movies_imdb_ids);

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://www.omdbapi.com")
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        MovieRESTInterface restInterface =
                retrofit.create(MovieRESTInterface.class);

        for (int i = 0; i < movieIds.length(); i++){
            String id = movieIds.getString(i);

            restInterface.getMovie(id, "b8c79639").enqueue(new Callback<Movie>() {
                @Override
                public void onResponse(Call<Movie> call, Response<Movie> response) {
                    Movie movie = response.body();
                    movies.add(movie);
                    if (movies.size() == movieIds.length())
                        setUpListView();
                }

                @Override
                public void onFailure(Call<Movie> call, Throwable t) {
                    System.out.println("ERROR");

                }
            });

        }


    }

    private void setUpListView(){
        ListView listView = findViewById(R.id.movieList);

        MovieArrayAdapter arrayAdapter =
                new MovieArrayAdapter(this, movies);

        listView.setAdapter(arrayAdapter);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_movies, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
