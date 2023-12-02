/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package store.util;

import java.util.Random;

public class randomUtil {
    public static Long randomId() {
        Random random = new Random();
        StringBuilder randomId = new StringBuilder();

        for (int i = 0; i < 4; i++) {
            int digit = random.nextInt(10);
            randomId.append(digit);
        }
        
        return Long.valueOf(randomId.toString());
    }
}
