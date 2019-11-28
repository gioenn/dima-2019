package it.polimi.deib.deepse.movies.adapter;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;

import it.polimi.deib.deepse.movies.R;
import it.polimi.deib.deepse.movies.model.Movie;

public class MovieArrayAdapter extends ArrayAdapter<Movie> {

    public MovieArrayAdapter(Context context, List<Movie> data) {
        super(context, 0 , data);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent){

        Movie movie = getItem(position);

        MovieViewHolder holder;

        if (convertView == null) {
            LayoutInflater li = (LayoutInflater) getContext()
                    .getSystemService(Context.LAYOUT_INFLATER_SERVICE);

            convertView = li.inflate(R.layout.movie_item, null);
            holder = new MovieViewHolder(convertView);
            convertView.setTag(holder);
        }
        else {
            holder = (MovieViewHolder) convertView.getTag();
        }

        holder.titleTV.setText(movie.getTitle());
        holder.directorNameTV.setText(movie.getDirectorName());

        return convertView;
    }

    static class MovieViewHolder {

        TextView titleTV;
        TextView directorNameTV;

        public MovieViewHolder(View view){
            this.titleTV = view.findViewById(R.id.movieTitleTV);
            this.directorNameTV = view.findViewById(R.id.directorNameTV);
        }

    }

}
