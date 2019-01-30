package sdx.webservice;


import javax.xml.ws.handler.Handler;
import javax.xml.ws.handler.HandlerResolver;
import javax.xml.ws.handler.PortInfo;
import java.util.ArrayList;
import java.util.List;

public class ServiceFactory {

    public static ServiceSoap getService(){
        Service service=new Service();
        service.setHandlerResolver(new HandlerResolver() {
            public List<Handler> getHandlerChain(PortInfo portInfo) {
                List<Handler> handlerChain = new ArrayList<Handler>();
                handlerChain.add(new AddAuthHandler());
                //ArrayOfEnvInfoDetail arrayOfEnvInfoDetail=service.getEnvInfoDetails(7501);
                return handlerChain;
            }
        });

        //ArrayOfDevice arrayOfDevice=service.getDevices(7501);
        //ArrayOfEnvInfoDetail arrayOfEnvInfoDetail=service.getEnvInfoDetails(7501);
        //arrayOfEnvInfoDetail.getEnvInfoDetail();

        //System.out.println(servic.isValid());
        return service.getServiceSoap();
    }

    public static void main(String[] args) {
   //     Executor executor = Executors.newSingleThreadExecutor();
//      executor.execute(new SendData());
//   ServiceSoap service = ServiceFactory.getService();
//  ArrayOfEnvInfoDetail arrayOfEnvInfoDetail = service.getEnvInfoDetails(7501);
//    arrayOfEnvInfoDetail.getEnvInfoDetail();
    }
}
