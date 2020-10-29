package com.example.lab_3;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private Intent serviceIntent;
    private Intent iService;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        serviceIntent = new Intent(this, MyService.class);
        iService = new Intent(this, MyIntentService.class);
        findViewById(R.id.start_service).setOnClickListener(this);
        findViewById(R.id.stop_service).setOnClickListener(this);
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
                startService(iService);
                break;
            case R.id.stop_iservice:
                stopService(iService);
                break;
        }
    }
}