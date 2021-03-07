package com.example.lab_5;

import android.app.IntentService;
import android.content.Intent;

import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import java.util.ArrayList;


public class MyIntentService extends IntentService {


    public MyIntentService() {
        super("MyIntentService");
    }

    @Override
    protected void onHandleIntent(Intent intent) {
        ArrayList<Integer> numbers = intent.getIntegerArrayListExtra(MainActivity.EXTRA_NUMBERS);
        int result = 0;
        for (Integer number : numbers) {
            result += number;
        }
        Intent resultIntent = new Intent(MainActivity.ACTION_RECEIVE_RESULT);
        resultIntent.putExtra(MainActivity.EXTRA_RESULT, result);
        LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(resultIntent);
    }
}