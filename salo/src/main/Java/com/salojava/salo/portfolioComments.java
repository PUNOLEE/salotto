package com.salojava.salo;

import java.util.Date;

/**
 * Created by PunoLee on 16/6/13.
 */
public class portfolioComments {
    private int PFCommentsID;
    private String PFCommentsContent;
    private int PFID;
    private int UID;
    private String PFCommentsDate;
    private int authorID;

    public int getAuthorID() {
        return authorID;
    }

    public void setAuthorID(int authorID) {
        this.authorID = authorID;
    }

    public int getPFCommentsID() {
        return PFCommentsID;
    }

    public void setPFCommentsID(int PFCommentsID) {
        this.PFCommentsID = PFCommentsID;
    }

    public String getPFCommentsContent() {
        return PFCommentsContent;
    }

    public void setPFCommentsContent(String PFCommentsContent) {
        this.PFCommentsContent = PFCommentsContent;
    }

    public int getPFID() {
        return PFID;
    }

    public void setPFID(int PFID) {
        this.PFID = PFID;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public String getPFCommentsDate() {
        return PFCommentsDate;
    }

    public void setPFCommentsDate(String PFCommentsDate) {
        this.PFCommentsDate = PFCommentsDate;
    }
}
