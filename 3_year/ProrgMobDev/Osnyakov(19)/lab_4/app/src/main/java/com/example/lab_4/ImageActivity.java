package com.example.lab_4;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ImageView;
import android.view.View;
import android.widget.TextView;

public class ImageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Bundle argument = getIntent().getExtras();
        setContentView(R.layout.activity_image);
        int image_count = argument.getInt("changeImage");
        if(image_count == 1){
            ImageView imageView = (ImageView) findViewById(R.id.studentImage);
            imageView.setImageResource(R.drawable.nikolai);
        }
        else if (image_count == 2) {
            ImageView imageView = (ImageView) findViewById(R.id.studentImage);
            imageView.setImageResource(R.drawable.andrew);
        }
        else if (image_count == 3){
            ImageView imageView = (ImageView) findViewById(R.id.studentImage);
            imageView.setImageResource(R.drawable.michael);
        }
        else if (image_count == 4){
            ImageView imageView = (ImageView) findViewById(R.id.studentImage);
            imageView.setImageResource(R.drawable.alexander);
        }
    }
}