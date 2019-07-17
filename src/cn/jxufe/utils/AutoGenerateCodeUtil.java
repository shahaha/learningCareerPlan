package cn.jxufe.utils;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
 
/**
 * 自动生成service和dao类代码的工具类
 * 
 * @author ypqiao
 *
 */
public class AutoGenerateCodeUtil {
	
	/**
	 * 执行方法
	 * @param domainDir domain目录
	 * @param serviceDir service目录
	 * @param daoDir dao目录
	 * @throws IOException
	 */
	public static void execute( File domainDir ,File serviceDir,File daoDir) throws IOException{
		
		// 检查目录是否为空
		if( domainDir == null || serviceDir == null || daoDir == null ) 
			throw new RuntimeException(" no such file ");
		
		// 检查domain目录下是否有文件
		File[] domain_Files = domainDir.listFiles();
		if( domain_Files.length == 0 )
			throw new RuntimeException(" no file in the domain dir ");
		
		
		for( File domain_File :domain_Files ){
			
			// 创建service接口和实现类
			create_interface_and_class_File(domain_File,serviceDir,"service");
			
			// 创建dao接口和实现类
			//create_interface_and_class_File(domain_File,daoDir,"dao");
		}
		
	}
 
	
	/**
	 * 在指定的目录下创建domain相应的接口和实现类
	 * @param domain_class_File 
	 * @param targetDir
	 * @param type 分为service和dao两种
	 * @throws IOException
	 */
	private static void create_interface_and_class_File(File domain_class_File,
			File targetDir,String type) throws IOException {
		
		String interface_file_suffix_Name = null;
		String interface_imp_file_suffix_Name = null;
		
		if( "service".equals(type)){
			interface_file_suffix_Name = "Service.java";
			interface_imp_file_suffix_Name = "ServiceImpl.java";
		} else if("dao".equals(type)){
			interface_file_suffix_Name = "Dao.java";
			interface_imp_file_suffix_Name = "DaoImpl.java";
		}
		
		
		// 检查imp目录是否存在，若不存在则创建该目录
		File impDir = null;
		for( File temp : targetDir.listFiles()){
			if( temp != null && "imp".equals(temp.getName())){
				impDir = temp;
				break;
			}
		}
		
		if( impDir == null ){
			impDir = new File(targetDir,"imp");
			impDir.mkdir();
		}
		
		// 创建接口文件
		String domain_interface_file_Name = domain_class_File.getName()
				.substring(0, domain_class_File.getName().indexOf("."))
				+interface_file_suffix_Name;
		
		File domain_interface_File = new File(targetDir,domain_interface_file_Name);
		domain_interface_File.createNewFile();
		
		// 输入接口文件内容
		BufferedWriter interfaceWriter  = new BufferedWriter(
				new FileWriter(domain_interface_File));
		
		String interfacePackageInfo = StringUtil.getPackageInfo(domain_interface_File);
		String interfaceInfo = StringUtil.getInterfaceInfo(domain_interface_File);
		
		interfaceWriter.write(interfacePackageInfo);
		interfaceWriter.write(interfaceInfo);
		
		interfaceWriter.flush();
		interfaceWriter.close();
		
		
		// 创建实现类文件
		String domain_interface_imp_file_Name = domain_class_File.getName()
				.substring(0, domain_class_File.getName().indexOf("."))
				+interface_imp_file_suffix_Name;
		
		File domain_interface_imp_file = new File(impDir,domain_interface_imp_file_Name);
		domain_interface_imp_file.createNewFile();
		
		// 输入实现类文件内容
		BufferedWriter impWriter  = new BufferedWriter(
				new FileWriter(domain_interface_imp_file));
		
		String classPackageInfo =  StringUtil.getPackageInfo(domain_interface_imp_file);;
		String importInfo = StringUtil.getImportInfo(domain_interface_File);
		String classInfo = StringUtil.getClassInfo(domain_interface_imp_file,
				domain_interface_File);
		
		impWriter.write(classPackageInfo);
		impWriter.write(importInfo);
		impWriter.write(classInfo);
		impWriter.flush();
		impWriter.close();
	}
	
	
	public static void main(String[] args) throws IOException {
		String basePath = System.getProperty("user.dir") + "\\src";
		System.out.println(basePath);
		File domainDir = new File(basePath + "\\cn\\jxufe\\entity");
		File serviceDir = new File(basePath + "\\cn\\jxufe\\service");
		File daoDir = new File(basePath + "\\test\\dao");
		execute(domainDir, serviceDir, daoDir);
	}
	
}
 
 
class StringUtil {
	
	/** 定义一个类Java文件的包信息 **/
	public static String getPackageInfo( File javaFile ){
		StringBuilder sb = new StringBuilder();
		sb.append("package ");
		
		String parentFilePath = javaFile.getParentFile().getPath();
		String packageStr = parentFilePath.substring(parentFilePath.indexOf("src\\")+4,
				parentFilePath.length());
		sb.append(packageStr.replace('\\', '.'));
		
		sb.append(";");
		sb.append("\n\n\n");
		
		return sb.toString();
	}
	
	
	/** 定义一个接口文件的接口信息 **/
	public static String getInterfaceInfo( File domain_interface_File ){
		StringBuilder sb = new StringBuilder();
		sb.append("public interface ");
		
		String interface_Name = domain_interface_File.getName()
				.substring(0,domain_interface_File.getName().indexOf("."));
		sb.append(interface_Name);
		
		sb.append(" {");
		sb.append("\n\n}");
		
		return sb.toString();
	}
	
	/** 定义一个类文件的类信息 **/
	public static String getClassInfo( File domain_interface_imp_File,File domain_interface_File ){
		StringBuilder sb = new StringBuilder();
		sb.append("public class ");
		
		String class_Name = domain_interface_imp_File.getName()
				.substring(0,domain_interface_imp_File.getName().indexOf("."));
		sb.append(class_Name);
		
		
		sb.append(" implements ");
		
		String interface_Name = domain_interface_File.getName()
				.substring(0,domain_interface_File.getName().indexOf("."));
		sb.append(interface_Name);
		
		sb.append(" {");
		sb.append("\n\n}");
		
		return sb.toString();
	}
	
	
	/** 定义一个类文件文件的import信息 **/
	public static String getImportInfo(File domain_interface_File){
		StringBuilder sb = new StringBuilder();
		sb.append("import ");
		
		String importStr = getPackageInfo(domain_interface_File).substring( getPackageInfo(domain_interface_File).indexOf("package")+8,getPackageInfo(domain_interface_File).indexOf(";"))
				+"."
				+domain_interface_File.getName().substring(0,domain_interface_File.getName().indexOf("."));
		sb.append(importStr);
		
		sb.append(";");
		sb.append("\n\n\n");
	
		return sb.toString();
		
	}
    	
 
}