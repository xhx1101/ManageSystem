
package sdx.webservice;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 * <pre>
 * &lt;complexType name="ArrayOfEnvInfoDetail">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="EnvInfoDetail" type="{http://tempuri.org/}EnvInfoDetail" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ArrayOfEnvInfoDetail", propOrder = {
    "envInfoDetail"
})
public class ArrayOfEnvInfoDetail {

    @XmlElement(name = "EnvInfoDetail", nillable = true)
    protected List<EnvInfoDetail> envInfoDetail;

    /**
     * Gets the value of the envInfoDetail property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the envInfoDetail property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getEnvInfoDetail().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link EnvInfoDetail }
     * 
     * 
     */
    public List<EnvInfoDetail> getEnvInfoDetail() {
        if (envInfoDetail == null) {
            envInfoDetail = new ArrayList<EnvInfoDetail>();
        }
        return this.envInfoDetail;
    }

}
