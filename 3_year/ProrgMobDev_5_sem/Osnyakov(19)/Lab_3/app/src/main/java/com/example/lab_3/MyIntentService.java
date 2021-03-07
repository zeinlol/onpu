package com.example.lab_3;

import android.app.IntentService;
import android.content.Intent;
import android.os.SystemClock;
import android.util.Log;
import androidx.annotation.Nullable;

import java.util.Arrays;

public class MyIntentService extends IntentService {
    public static final String TAG = "MyIntentService";

    public MyIntentService() {
        super("MyIntentService");
        setIntentRedelivery(true);
    }

    @Override
    public void onCreate() {
        super.onCreate();

    }

    @Override
    protected void onHandleIntent(@Nullable Intent intent) {
        Log.d(TAG, "start...");
        int input = intent.getIntExtra("inputExtra", 0);
        String temp = Integer.toString(input);
        int[] arr = new int[temp.length()];
        for (int a = 0; a < temp.length(); a++)
        {
            arr[a] = input %10;
            input /= 10;
        }
        Arrays.sort(arr);
        for (int i = 0; i < arr.length; i++) {
            Log.d(TAG, "arr:   " +  arr[i] + "   " + i);
            SystemClock.sleep(1000);
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "Done!");
    }
}