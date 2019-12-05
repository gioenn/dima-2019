package it.polimi.deib.deepse.movies.data;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.provider.BaseColumns;

public class MovieDBContract {

    private static String DATABASE_NAME = "Movies.db";

    private static final String SQL_CREATE_MOVIE_TABLE =
            "CREATE TABLE IF NOT EXISTS "+MovieEntry.TABLE_NAME+
            " ("+MovieEntry._ID+" varchar PRIMARY KEY, "+
            MovieEntry.USER_RATING_CLM+" float, "+
            MovieEntry.USER_REVIEW_CLM+" text)";

    public static SQLiteDatabase getWritableDatabase(Context context){
        return new MovieDBHelper(context).getWritableDatabase();
    }

    public static SQLiteDatabase getReadableDatabase(Context context){
        return new MovieDBHelper(context).getReadableDatabase();
    }

    public static class MovieEntry implements BaseColumns {
        public static final String TABLE_NAME = "movie";
        public static final String USER_RATING_CLM = "user_rating";
        public static final String USER_REVIEW_CLM = "user_review";
    }

    public static class MovieDBHelper extends SQLiteOpenHelper {

        public MovieDBHelper(Context context) {
            super(context, DATABASE_NAME, null, 1);
        }

        @Override
        public void onCreate(SQLiteDatabase db) {
            db.execSQL(SQL_CREATE_MOVIE_TABLE);
        }

        @Override
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

        }
    }


}
