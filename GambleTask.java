/* Program: GambleTask
 * 
 *Execute: file name  in run arguments or replace "args[0]"
 *                in line 16 with file name ""
 *
 *Description: prints and saves task images based on parameters in txt file
 */
 
import java.io.IOException;
import javax.imageio.ImageIO;
import java.util.concurrent.TimeUnit;

public class GambleTask {

   public static void main(String[] args) {
   
      String filename = "trialList.txt";
      In inStream = new In(filename);
   
      if (args.length != 0) {
         filename = args[0];
      }
   
      while (!inStream.isEmpty()) {
         int s = inStream.readInt();
         int x = inStream.readInt();
         double xx = inStream.readDouble();
         int n = inStream.readInt();
         int nn = inStream.readInt();
         GambleTask(x, xx,  n, nn);
         PennDraw.save(s +".png");
         PennDraw.clear();
      }
        
      /*Input parameters for GambleTask()
       *GambleTask(alt amount, alt percentage, group size, bot size) */
       
      //GambleTask(int x, double xx, int n, int nn)
   }
   
   public static void GambleTask(int x, double xx, int n, int nn) {
   
      PennDraw.setXscale(0,150);
      PennDraw.setYscale(0,180);
      
      //input variables
      int altAmount = x;
      double altPercentage = xx;
      int groupSize = n;
      int botSize = nn;
      
      int xCenter1 = 40;
      int xCenter2 = 100;
      int yCenter = 70;
      int halfLength = 20;
      int halfHeight = 50;
      
      PennDraw.rectangle(xCenter1, yCenter, halfLength, halfHeight);
      PennDraw.rectangle(xCenter2, yCenter, halfLength, halfHeight);
      PennDraw.setPenColor(PennDraw.RED);
      PennDraw.filledRectangle(xCenter1, ((100 - altPercentage) / 2) +20, halfLength, ((100 - altPercentage) / 2));
      PennDraw.filledRectangle(xCenter2, 20 + altPercentage/2, halfLength, altPercentage/2);
      PennDraw.setPenColor(PennDraw.BLACK);
   
      for (int i = 0; i <= 100; i = i +20) {
         PennDraw.setFontSize(15);
         PennDraw.text(65, i + 20,  i + "%");
         PennDraw.text(125, i + 20,  i + "%");
         //PennDraw.line(20, i + 20 , 60, i + 20);
         //PennDraw.line(80, i + 20 , 120, i + 20);
      }
      
      PennDraw.setFontSize(25);
      PennDraw.text(xCenter1, 10, "$5");
      PennDraw.text(xCenter2, 10, "$" + x);
   
      PennDraw.setFontSize(50);
      
      //PennDraw.picture(68, 138, "peeps.png", 80, 55); //old, next to e.o desig\\
      //PennDraw.text(86, 135, "" + n);
      PennDraw.picture(111, 168 , "peeps.png", 80, 55); 
      PennDraw.text(132, 165, "" + n);
      
      PennDraw.picture(111, 143, "computer.png", 80, 55); 
      PennDraw.text(132, 140, "" + nn);
    
   
   }
}
