package com.salojava.salo;
import com.salojava.dao.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

/**
 * Created by Ashe on 16/6/7.
 */
public class PostReply {
    private int PRID;
    private int PID;
    private int UID;
    private String PRContent;
    private Timestamp PRDate;
    private String UPhoto;
    private String UName;

    public String getUName() {
        return UName;
    }

    public void setUName(String UName) {
        this.UName = UName;
    }


    public int getPRID() {
        return PRID;
    }

    public void setPRID(int PRID) {
        this.PRID = PRID;
    }

    public int getPID() {
        return PID;
    }

    public void setPID(int PID) {
        this.PID = PID;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public String getPRContent() {
        return PRContent;
    }

    public void setPRContent(String PRContent) {
        this.PRContent = PRContent;
    }

    public Timestamp getPRDate() {
        return PRDate;
    }

    public void setPRDate(Timestamp PRDate) {
        this.PRDate = PRDate;
    }

    public String getUPhoto() {
        return UPhoto;
    }

    public void setUPhoto(String UPhoto) {
        this.UPhoto = UPhoto;
    }
}


