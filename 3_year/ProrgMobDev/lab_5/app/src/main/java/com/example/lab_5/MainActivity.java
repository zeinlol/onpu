package com.example.lab_5;

import androidx.appcompat.app.AppCompatActivity;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.Gravity;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Random;

public class MainActivity extends AppCompatActivity {
    public static final String ACTION_RECEIVE_RESULT = "ACTION_RESULT";
    public static final String EXTRA_NUMBERS = "EXTRA_NUMBERS";
    public static final String EXTRA_RESULT = "EXTRA_RESULT";

    private BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            if(intent.getAction().equals(ACTION_RECEIVE_RESULT)){
                toast = Toast.makeText(getApplicationContext(), "Result = " + intent.getIntExtra(EXTRA_RESULT, -1), Toast.LENGTH_LONG);
                toast.setGravity(Gravity.CENTER, 0,0);
                toast.show();
            }
        }
    };
    private Toast toast;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        LocalBroadcastManager.getInstance(this).registerReceiver(receiver, new IntentFilter(ACTION_RECEIVE_RESULT));
        ArrayList<Integer> numbers = new ArrayList<>();
        numbers.add(23);
        numbers.add(5);
        numbers.add(15);
        numbers.add(134);
        numbers.add(76);
        numbers.add(45);
        Intent intent = new Intent(this, MyIntentService.class);
        intent.putExtra(EXTRA_NUMBERS, numbers);
        startService(intent);
    }
}