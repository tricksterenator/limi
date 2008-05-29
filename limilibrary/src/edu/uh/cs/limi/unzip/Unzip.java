/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uh.cs.limi.unzip;

import java.io.*;
import java.util.*;
import java.util.zip.*;

/**
 *
 * @author Haimei Zhu
 */
public class Unzip {

    public static void extZipFileList(String zipFileName, String extPlace) {
        try {

            ZipInputStream in = new ZipInputStream(new FileInputStream(
                    zipFileName));

            ZipEntry entry = null;

            while ((entry = in.getNextEntry()) != null) {

                String entryName = entry.getName();

                if (entry.isDirectory()) {
                    File file = new File(extPlace +"//"+ entryName);
                    file.mkdirs();
                    // System.out.println("create directory:" + entryName);
                } else {

                    FileOutputStream os = new FileOutputStream(extPlace +"//"+ entryName);

                    //   Transfer   bytes   from   the   ZIP   file   to   the   output   file  
                    byte[] buf = new byte[1024];

                    int len;
                    while ((len = in.read(buf)) > 0) {
                        os.write(buf, 0, len);
                    }
                    os.close();
                    in.closeEntry();

                }
            }
            in.close();

        } catch (IOException e) {
        }
        //System.out.println("unzip successfully!");
    }
}
