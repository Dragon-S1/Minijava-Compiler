import syntaxtree.*;
import visitor.*;

public class A4 {
   public static void main(String [] args) {
      try {
         Node root = new microIRParser(System.in).Goal();
        //  System.out.println("Program parsed successfully");
         root.accept(new RegAlloc<String, String>(), ""); // Your assignment part is invoked here.
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 

