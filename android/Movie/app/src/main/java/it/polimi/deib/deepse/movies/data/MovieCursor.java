package it.polimi.deib.deepse.movies.data;

import android.database.Cursor;
import android.database.CursorWrapper;

public class MovieCursor extends CursorWrapper {
    public MovieCursor(Cursor cursor) {
        super(cursor);
    }

    public String getImdbId(){
        return getString(getColumnIndex(MovieDBContract.MovieEntry._ID));
    }

    public float getUserRating(){
        return getFloat(getColumnIndex(MovieDBContract.MovieEntry.USER_RATING_CLM));
    }

    public String getUserReview(){
        return getString(getColumnIndex(MovieDBContract.MovieEntry.USER_REVIEW_CLM));
    }
}
