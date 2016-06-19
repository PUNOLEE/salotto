package com.salojava.salo;

import java.text.DateFormat;
import java.util.Date;

/**
 * Created by PunoLee on 16/6/10.
 */
public class Portfolio {
    private int PfID;

    public int getPfID() {
        return PfID;
    }

    public void setPfID(int pfID) {
        PfID = pfID;
    }

    public String getPfTitle() {
        return PfTitle;
    }

    public void setPfTitle(String pfTitle) {
        PfTitle = pfTitle;
    }

    public int getPfPCount() {
        return PfPCount;
    }

    public void setPfPCount(int pfPCount) {
        PfPCount = pfPCount;
    }

    public String getPfDescribe() {
        return PfDescribe;
    }

    public void setPfDescribe(String pfDescribe) {
        PfDescribe = pfDescribe;
    }

    public String getPfTags() {
        return pfTags;
    }

    public void setPfTags(String pfTags) {
        this.pfTags = pfTags;
    }

    public int getPfLikesCount() {
        return PfLikesCount;
    }

    public void setPfLikesCount(int pfLikesCount) {
        PfLikesCount = pfLikesCount;
    }

    public int getPfCommentCount() {
        return PfCommentCount;
    }

    public void setPfCommentCount(int pfCommentCount) {
        PfCommentCount = pfCommentCount;
    }

    public Date getPfDate() {
        return PfDate;
    }

    public void setPfDate(Date pfDate) {
        PfDate = pfDate;
    }

    private String PfTitle;
    private int PfPCount;
    private String PfDescribe;
    private String pfTags;
    private int PfLikesCount;
    private int PfCommentCount;
    private Date PfDate;

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    private int UID;

}
