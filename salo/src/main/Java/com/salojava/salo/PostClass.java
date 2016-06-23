package com.salojava.salo;

/**
 * Created by Ashe on 16/6/7.
 */
public class PostClass {
    private int CID;
    private String CName;
    private String CDescript;
    private int CPCount;
    private int CRCount;

    public int getCPCount() {
        return CPCount;
    }

    public void setCPCount(int CPCount) {
        this.CPCount = CPCount;
    }

    public int getCRCount() {return CRCount;}

    public void setCRCount(int CRCount) {
        this.CRCount = CRCount;
    }


    public int getCID() {
        return CID;
    }

    public void setCID(int CID) {
        this.CID = CID;
    }

    public String getCName() {
        return CName;
    }

    public void setCName(String CName) {
        this.CName = CName;
    }

    public String getCDescript() {
        return CDescript;
    }

    public void setCDescript(String CDescript) {
        this.CDescript = CDescript;
    }
}
