package it.polimi.deib.deepse.movies.data;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import it.polimi.deib.deepse.movies.model.Movie;

import static it.polimi.deib.deepse.movies.data.MovieDBContract.*;

public class MovieDBRepository {

    private SQLiteDatabase db;

    public MovieDBRepository(Context context){
        db = getWritableDatabase(context);
    }

    public void add(Movie movie){
        db.execSQL("INSERT OR REPLACE INTO "+MovieEntry.TABLE_NAME+
        " ("+MovieEntry._ID+","+MovieEntry.USER_RATING_CLM+","+MovieEntry.USER_REVIEW_CLM
                +") VALUES (?,?,?)",
                new Object[]{movie.getImdbId(), movie.getUserRating(), movie.getUserReview()});
    }

    public void delete(Movie movie){
        db.execSQL("DELETE FROM "+MovieEntry.TABLE_NAME+ " WHERE "+MovieEntry._ID+" = ?",
                new Object[]{movie.getImdbId()});
    }

    public MovieCursor findAll(){
        Cursor res = db.rawQuery("SELECT * FROM "+MovieEntry.TABLE_NAME, null);
        return new MovieCursor(res);
    }

    public MovieCursor findById(String movieId){
        Cursor res = db.rawQuery("SELECT * FROM "+MovieEntry.TABLE_NAME+
                " WHERE "+MovieEntry._ID+" = ?", new String[]{movieId});
        return new MovieCursor(res);
    }
}
