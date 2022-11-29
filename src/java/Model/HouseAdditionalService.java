/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class HouseAdditionalService {
    private int houseaddserviceid;
    private int serviceid;
    private int houseid;

    public HouseAdditionalService() {
    }

    public HouseAdditionalService(int houseaddserviceid, int serviceid, int houseid) {
        this.houseaddserviceid = houseaddserviceid;
        this.serviceid = serviceid;
        this.houseid = houseid;
    }

    public int getHouseaddserviceid() {
        return houseaddserviceid;
    }

    public void setHouseaddserviceid(int houseaddserviceid) {
        this.houseaddserviceid = houseaddserviceid;
    }

    public int getServiceid() {
        return serviceid;
    }

    public void setServiceid(int serviceid) {
        this.serviceid = serviceid;
    }

    public int getHouseid() {
        return houseid;
    }

    public void setHouseid(int houseid) {
        this.houseid = houseid;
    }

    
}
