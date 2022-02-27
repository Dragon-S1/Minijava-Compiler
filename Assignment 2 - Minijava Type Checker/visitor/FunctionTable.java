
package visitor;

import syntaxtree.*;
import java.util.*;

public class FunctionTable 
{
    public ArrayList<String> argList;
    public ArrayList<String> argTypeList;
    
    public HashMap<String,String> ffList;
    public String returnType;
    public String className;

    public FunctionTable()
    {
    }

    public FunctionTable(String className,String rtype)
    {
        argList = new ArrayList<String>();
        argTypeList = new ArrayList<String>();
        ffList = new HashMap<String,String>();
        returnType = rtype;
        this.className = className;
    }

    public void insertFField(String type,String id)
    {
        if(!this.ffList.containsKey(id))
        {
            this.ffList.put(id,type);
        }
    }

    public void insertArgument(String type, String id)
    {
        if(!this.argList.contains(id))
        {
            this.argList.add(id);
            this.argTypeList.add(type);
        }
    }

    public String getArgumentType(String val)
    {
        for(int i=0;i<argList.size();++i)
          if(val.equals(argList.get(i)))
            return argTypeList.get(i);
        return "";
    }
}