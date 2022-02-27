package visitor;

import syntaxtree.*;
import java.util.*;

class SymbolTable
{
   public HashMap<String,ClassTable> cList;
   public int scope_flag;

   public ClassTable curr_c;
   public FunctionTable curr_f;   
 
   public SymbolTable()
   {
      cList = new HashMap<String,ClassTable>();
      scope_flag=0;
      curr_c=null;
      curr_f=null;
   }

   public boolean findClass(String cn)
   {
      return cList.containsKey(cn);
   }

   public void insertClass(String cn)
   {
      ClassTable ct = new ClassTable(cn);
      if(!cList.containsKey(cn))
      {
         cList.put(cn,ct);
      }

   }
 
   public void insertClass(String cn, String pt)
   {
      ClassTable ct = new ClassTable(cn,pt);
      if(!cList.containsKey(cn))
      {
         cList.put(cn,ct);
      }
   }
  
   public void insertFunction(String fname,String rtype)
   {
      curr_c.insertFunction(fname, rtype);
   }

   public void insertFnArgument(String type, String id)
   {
      curr_f.insertArgument(type, id);
   }

   public void setCurrClass(String cn)
   {
      scope_flag=1;
      curr_c = cList.get(cn);
   }

   public void setCurrFn(String cf)
   {
      scope_flag=2;
      curr_f = curr_c.fnList.get(cf);
   }

   public void unsetCurrFn()
   {
      scope_flag=1;
      curr_f=null;
   }

   public void unsetCurrClass()
   {
      scope_flag = 0;
      curr_c=null;
   }

   public void insertField(String type,String id)
   {
      switch(scope_flag)
      {
         case 1:
            curr_c.insertCField(type, id);
         break;
         case 2:
            curr_f.insertFField(type, id);
         break;
         default:
      }
   }

   public boolean checkAncestor(String child,String parent)
   {
      if(cList.get(child).classParent.equals(""))return false;
      else if(cList.get(child).classParent.equals(parent))return true;
      else return this.checkAncestor(cList.get(child).classParent, parent);
   }

   public boolean verifySignature(String cname, String fname, ArrayList<String> signature)
   {
      ClassTable ct = cList.get(cname);
      if(ct.findFunction(fname))
      {
         if(ct.verifySignature(fname,signature,this))return true;
         else return false;
      }
      else
      {
         if(ct.classParent.equals(""))return false;
         else return this.verifySignature(ct.classParent, fname, signature);        
      }
   }

   public String getReturnType(String cname, String fname, ArrayList<String> signature)
   {
      ClassTable ct = cList.get(cname);
      if(ct.findFunction(fname))return ct.getReturnType(fname, signature);
      else return this.getReturnType(ct.classParent, fname, signature);
   }

    public boolean findVarInClass(ClassTable c, String var)
    {
      if(c.cfList.containsKey(var))return true;
      else
      {
         if(c.classParent.equals(""))return false;
         else return this.findVarInClass(this.cList.get(c.classParent),var);
      }
    }
   
   public boolean findVariable(String var)
   {
      return curr_f.argList.contains(var) || curr_f.ffList.containsKey(var) || this.findVarInClass(curr_c,var);
   }

   public String getTypeInClass(ClassTable c, String var)
   {
      if(c.cfList.containsKey(var))return c.cfList.get(var);
      else return this.getTypeInClass(this.cList.get(c.classParent), var);
   }

   public String getType(String var)
   {  
      if(curr_f.argList.contains(var))
         return curr_f.getArgumentType(var);
      else if(curr_f.ffList.containsKey(var))
         return curr_f.ffList.get(var);
      else
         return this.getTypeInClass(curr_c,var);
   }

}