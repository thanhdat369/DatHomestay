/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.idprocess;

import datlt.models.RoomOrderDAO;
import java.io.Serializable;

/**
 *
 * @author LEE
 */
public class IDCreating implements Serializable {

    public static String createRoomOrderID() throws Exception {
        String id;
        RoomOrderDAO dao = new RoomOrderDAO();
        id = dao.getLastID();
        if (id.equals("norecord")) {
            id = "RO-1";
        } else {
            long temp = Long.parseLong(id.substring(3));
            temp++;
            id = "RO-" + temp;
        }
        return id;
    }
}
