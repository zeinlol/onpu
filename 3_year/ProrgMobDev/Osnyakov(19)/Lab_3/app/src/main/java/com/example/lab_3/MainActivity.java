package com.example.lab_3;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private Intent serviceIntent;
    private Intent iService;
    private EditText intInput;
    private String input = "";
    public static final String TAG = "MyIntentService";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        serviceIntent = new Intent(this, MyService.class);
        iService = new Intent(this, MyIntentService.class);
        findViewById(R.id.start_service).setOnClickListener(this);
        findViewById(R.id.stop_service).setOnClickListener(this);
        findViewById(R.id.start_iservice).setOnClickListener(this);
        findViewById(R.id.stop_iservice).setOnClickListener(this);
        intInput = findViewById(R.id.numbers);
    }


    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.start_service:
                startService(serviceIntent);
                break;
            case R.id.stop_service:
                stopService(serviceIntent);
                break;
            case R.id.start_iservice:
                input = intInput.getText().toString();
                if (!input.equals("")) {
                    int data = 0;
                    try {
                        data = Integer.parseInt(input);
                    } catch (Exception e) {
                        Log.d(TAG, "error:  " + e);
                        data = 0;
                    }

                    Log.d(TAG, "data:   " + data);
                    startService(iService);
                    iService.putExtra("inputExtra", data);
                }
                break;
            case R.id.stop_iservice:
                stopService(iService);
                break;
        }
    }
}