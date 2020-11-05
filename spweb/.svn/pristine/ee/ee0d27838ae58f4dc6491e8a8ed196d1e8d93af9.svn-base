package properties;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


@Component
public class ServerProperties {

	@Value("#{serverProperties['server.ip']}")
	private String serverIp;
	
	@Autowired
	private Properties serverProperties;
	
	public String propertiesServerIp() {
		System.out.println("asdasdsa : " + serverIp);
		return serverIp;
	}
}
