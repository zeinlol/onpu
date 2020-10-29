package com.example.lab_3;

import android.app.IntentService;
import android.content.Intent;
import android.content.Context;
import android.os.IBinder;
import android.util.Log;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.concurrent.TimeUnit;

public class MyIntentService extends IntentService {

    /**
     * Creates an IntentService.  Invoked by your subclass's constructor.
     *
     * @param name Used to name the worker thread, important only for debugging.
     */
    public MyIntentService(String name) {

        super(name);
    }

    @Override
    public void onCreate() {
        Log.d("iService", "iStart do something...");
        super.onCreate();
    }

    @Override
    protected void onHandleIntent(@Nullable Intent intent) {
        try {
            Log.d("iService", "iStart do something...");
            Thread.sleep(TimeUnit.SECONDS.toMillis(5));
            Log.d("iService", "iOperation  has finished");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return super.onStartCommand(intent, flags, startId);
    }

    @Override
    public void onDestroy() {
        Log.d("iService", "iService has stopped");
        super.onDestroy();
    }





}