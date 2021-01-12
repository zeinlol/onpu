package com.example.firstlab;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;


public class MainActivity extends AppCompatActivity {

    private Button EditBtn;
    private TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EditBtn = findViewById(R.id.button);
        textView = findViewById(R.id.textView);

        View.OnClickListener onClickListener = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                textView.setText("Новый текст!");
            }
        };
        EditBtn.setOnClickListener(onClickListener);





    }


}