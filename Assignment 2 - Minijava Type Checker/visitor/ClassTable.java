package visitor;

import syntaxtree.*;
import java.util.*;

public class ClassTable 
{
    public HashMap<String,FunctionTable> fnList;
    public HashMap<String,String> cfList;
    public String classParent;
    public String className;

    public ClassTable()
    {
    }

    public ClassTable(String name)
    {
        fnList = new HashMap<String, FunctionTable>();
        cfList = new HashMap<String,String>();
        this.className = name;
        this.classParent = "";
    }

    public ClassTable(String name,String parent)
    {
        fnList = new HashMap<String, FunctionTable>();
        cfList = new HashMap<String,String>();
        this.className = name;
        this.classParent=parent;
    }

    public void insertCField(String type,String id)
    {
        if(!cfList.containsKey(id))
        {
            cfList.put(id,type);
        }
    }

    public void insertFunction(String fname, String rtype)
    {
        FunctionTable ft = new FunctionTable(fname,rtype);
        if(!this.fnList.containsKey(fname))
        {
            this.fnList.put(fname,ft);
        }
    }

    public boolean findFunction(String fname)
    {
        return fnList.containsKey(fname);
    }

    public boolean testSuperClass(String sup, String  chld,SymbolTable T)
    {
        if(T.cList.get(chld)==null)return false;
        if(T.cList.get(chld).classParent.equals(""))return false;
        else if(T.cList.get(chld).classParent.equals(sup))return true;
        else return this.testSuperClass(sup,T.cList.get(chld).classParent,T);
    }

    public boolean verifySignature(String fname, ArrayList<String> sgn, SymbolTable T)
    {
        FunctionTable ft = fnList.get(fname);
        int sgn_size = sgn.size();
        int ft_size = ft.argTypeList.size();
        if(sgn_size!=ft_size)return false;
        else
        {
            boolean flag = true;
            for(int i=0;i<sgn_size;++i)
            {
            if(!(sgn.get(i).equals(ft.argTypeList.get(i))))
            {
                if(sgn.get(i).equals("int") || sgn.get(i).equals("int[]") || sgn.get(i).equals("boolean"))
                {
                    flag = false;
                    break;
                }
                else
                {
                    flag = this.testSuperClass(ft.argTypeList.get(i),sgn.get(i),T);
                    if(!flag)break;
                }
            }
            }
            return flag;
        }
    }

    public String getReturnType(String fname, ArrayList<String> sgn)
    {
        return this.fnList.get(fname).returnType;
    }

}
