package com.example.lab_4;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.Collections;

public class MainActivity extends AppCompatActivity {
    public static final String ACTION="com.eugene.SHOW_SECOND_ACTIVITY";

    private Button EditBtn;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Intent intent = new Intent(ACTION);
        ArrayList<String> students = new ArrayList<>();
        students.add("Elon ");
        students.add("Osnaykov Bogdan");
        students.add("Alexander Gymenuk");
        students.add("Gandalf");
        students.add("Andrew Vedeniev");



        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, students);
        ListView studentsList = (ListView) findViewById(R.id.studentsList);
        studentsList.setAdapter(adapter);
        studentsList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                if (position == 0) {
                    startActivity(intent);
                }
                else if (position == 1){
                    intent.putExtra("changeImage", 1);
                    startActivity(intent);
                }
                else if (position == 2){
                    intent.putExtra("changeImage", 2);
                    startActivity(intent);
                }
                else if (position == 3){
                    intent.putExtra("changeImage", 3);
                    startActivity(intent);
                }
                else if (position == 4){
                    intent.putExtra("changeImage", 4);
                    startActivity(intent);
                }
            }
        });

        EditBtn = findViewById(R.id.button);
        View.OnClickListener onClickListener = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Collections.shuffle(students);
                studentsList.setAdapter(adapter);
            }
        };
        EditBtn.setOnClickListener(onClickListener);
    }
}