package it.polimi.deib.deepse.firstapp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.alternative_main);

        textView = findViewById(R.id.resultTextView);
        textView.setText("-");

    }

    public void computeLen(View view){
        EditText editText = findViewById(R.id.editText);
        String text = editText.getText().toString();
        int len = text.length();
        textView.setText(""+len);
    }
}
