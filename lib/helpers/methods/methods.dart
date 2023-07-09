import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Methods{

  void compartirUrl(nameCourse) {
    Share.share("Acabé de encontrar un " +
        nameCourse +
        " GRATIS y CON CERTIFICADO incluido 🥳" +
        "\n\nDan acceso a este y otros cursos gratis en esta App llamada Cursin 👏🏻" +
        " Aprovechala que recién la acaban de sacar en la PlayStore 🥳👇🏼" +
        "\n\nhttps://play.google.com/store/apps/details?id=com.appcursin.blogspot");
  }

    //metodo para ejecutar el link de abrir en Chrome
  void openUrl(url) async {
    if (await canLaunch(url)) launch(url);
  }

  void copiarEnlace(url) {
    Clipboard.setData(ClipboardData(text: url));
    Fluttertoast.showToast(
      msg: "Enlace copiado", // message
      toastLength: Toast.LENGTH_LONG, // length
      gravity: ToastGravity.BOTTOM, // location
    );
  }

  //metodo para obtener la imagen network de una categoria de cursos
  String getImgCategoria(categoria){

  String img='';

    switch (categoria) {

            case 'desarrollo':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiJqpZbzMOtEBoJjJ97RzpXhTgvgaKFDhX_cgWY-jmPHtjV6-vhwrz3_3ze2AHk50gIOniNfRmid24xby16aEgpjOR5km1QZw2sPBt-IUWBRs9WHW7y61nQIDx5V5A-q4lqb156uqhxnI48dG0aS9eFHCjpYWV4E94jCRxHkpJ5bb22w9k9dfy6KJPA/s320/2%20ic_prog.png';
        break;


        case 'tic':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgQPSTVMbAcAWXSBTmSW5q34lhkZCi9Qs5j_t2iA09xLBUAnuneVLGzc01ULxcNt4o27NDX7iRPF2t9rGscqJHDwcnL0XWSoxMblUCYFG68xwD2ZOlKldfKpCqdn8geeFud1484z24yrjlyJj5neyRxP7cQFWds-cI1CCUkBf3ne5iJVDMF_oP-rn33/s320/2%20ic_tic.png';
        break;


        case 'finanzas':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjg_GlboAtET0sc9CW-IstSj5SKGZHQ7tT3n8Ermzesc-u8bwrTJbmdi37fLC5pTJpY936fSSmhqjw0j_N7Kf7MxGfeWjR3fiCke42BaAU_-u57hGSpij9WjEq9f_pIwSi4N26MDsaR1YleFtk8n-YzM8njGRlR9H58R6h6G9FmzhHvx-4hzpvz1I0w/s320/2%20ic_finanzas.png';
        break;


            case 'idiomas':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh76r1q_gpILE8MX05unZRO2oSYVk-kPM48D3z6_sQTZY_zsCbbO1ukiFmW9w5LTnNzg4LPViWaytvDmMUdJ1zl-8pJMdoPi8mI7NiBelj8cX4hM5sK8-SflREe8Srhu9cbRMC7stHw7y82rFBvP7TN6WSk-9IWnS0XDgWGp5atjcUayqLcVnH5JuXN/s320/2%20ic_idiomas.png';
        break;


            case 'datos':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjcqJ8KvIPhF3D2EKbiR_CT5ORtu-ujQHktfrTKfd8GscZddfOH3A4l4oqzpbDibnRs0DdSGQH2KvmHSp_pKBSVMloEFdPphy0J-auJXNZDpTVooufMiPdrUSuMjTpbOlRJb4SnWSz7shydhj_b929vrltDdhJIm_VRXRTjEe8s4jbH8Lj44NnhAw60/s320/2%20ic_cienciadatos.png';
        break;


            case 'artes':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi5Bs000cWP9VFBVCQs5u74p-GuYy1rzY7T4XXZ5uzVA6tVnqj4EheMIsJmFbz1Q037pd815bfKYFeCne1txYPeL_hw74Z0gdqaDCqcb_OQVcXFvFjIu06-gKB0TasUodO2T3QwCXONg3dqDwY_liAIPZr5UArck5a7WCPg1wVMARtpazwODR8j350p/s320/2%20ic_artes.png';
        break;


        case 'ia':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiMcLiGpNql3dy3Wh0Hr4puwu-ZQ7vDC3VA25hX8rInr8YWBiYUiDXI-v_bCeDACoDPU10BwQHQOvuAMBu2Q-nqz9VLlSLpbkx52N2jZC9PYxNO8D2lxItn6C2r_4ramLDor2JmrwCdOsmHXSeTmExHd6bcK2ix4L_m4Ml4d-vHSjWb8I9KsewgDB9w/s320/2%20ic_ia.png';
        break;


        case 'cripto':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiR1dFIC9qxdhpjBwxe34PpYbs1hVpPFcl6uhff8nWJQbFW9oBhM_xbVd6cfGuGW0CQGQLX90V9FeEIs-EaDWfk4G29iqaL1EljNsW63VtzuTyLzpNENXkynAf4pVnHhpKQtDWIpLt7LeT4-8SNV3SeRiijY9C8tmUAmyf9MkeHmFxdm13w6jhX1IgG/s320/2%20ic_crypto.png';
        break;

                case 'belleza':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgTdZ1QWjWoPOSZufs_b7-UcO_ZANJlep0kLVR4R7fE7lDN-Bu3t7yFwhMiNaQF6iRj2URwCMaMaALox5WJL5aC7eoJ1JFWdkGio8lCZRy7DpUHPTLQIwxrwjdaSm5urFFFB_ZyEcN5Hj9Nu0SAQwZAuWQ8zhXlMaUSgguT_NljvHf0c9oZ1TtS69u4/s320/2%20ic_belleza.png';
        break;


        case 'salud':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi99NJa71oiGiixwFGVyU74_irSpNswsUW3RRmGOwwpLesbUd_if_l2MMw9b_W8H9FoL3wjwLpic73b1Nu6c-VVkIInhj38U09Ye5_eHE5GfV6mVDCNFc5KbZL3GkAZgV4qpLpGRqV6ObMUJ9TwZq4_UN3l_SqbEVzSbQzO5_Q8Ea5S2RMIVhDn_Rlx/s320/2%20ic_salud.png';
        break;


            case 'profesionales':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi1DfaWawYoV8-IYggSknJXVvkE524T9iEmkoisQ4D_PEOQ1EnBPdqRSZau5nz518bCkXaYbObXvc2irrgPibRxi24O5PtmzDv9NC9GaCdtqq8Piopomzya1WXEjcIUFNeAPkE60CVyLOAKHcP1aA6IRmtqaL4408qGoBQmsIpsfOSCPEBQx6ljL2__/s320/2%20ic_prof.png';
        break;


        case 'otros':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhqTTbuyISWIlLdY1rTwqZ23I2TKLL69egbM7aTLR1eAGzIKPlJqCYtxAi111ussEJkO_Dlrz1sxsrX3vlkLTXzBnG2cwHRt_goamFPQRv7i14wY8dgPV2C2Hef20JtL4grDoyyAx2evBKwIiM1IU_W4aKITUMh8rv1CEoD2RdRtytb5VgvluTKysK5/s320/2%20ic_otros.png';
        break;


        case 'sociales':
        img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg5v3n2OhCoDwkniIVf0Ss9tKjW8Hd70l1NdB61JeJ9noqDbUsuUJLOpkeBJ3fan0ziXEqu5kioElh3iAHi7rUTLfvoeKG4-9hHpnBuwP7ODFEgiZLIZhXp6ap8kR3yhhDPakT3ej863iBxwM_oR--hXCt3A4tR2am2qMKTtRrMtm0wPCPQOH_JnBe-/s320/2%20ic_juridic.png';
        break;


            case 'razonamiento':
        img =       "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg3I5wmNOHMv4Pw2sY_qh8x9VlKMl9C8SgLgwYSSlvFeP1QJMgq_TdSVUZnnw1ULSvaM05HroYDIF6y1zxcD-a-WGsFCt7-xG9DAQe9vLJ7TJJTT9q8052eGqZmEW0G8HLt7G1Hl2agBbfo74bW6homHlwfznXwpfYsHo8HxdNR3fGdlbMxlOXNODKV/s320/2%20ic_razonamiento.png";

        break;

        case 'musica':
        img =       "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgVpe-XYYpyQ-yU9YYEoY_rAcDKlMLY8JBH-Nztm97rR6WuDw4eSYMfVHGODdEA0P2v0gHgprFQc3GPA5nV25pxoB9SdT_kCOdu3ocCDvmSEoxOuIHfGHfhaHwzNhk_OQb5-ucZNGj62z7-poVOsQuJkclVx26qP62COL1Njgf7R-HsBSwEHV8IaksY/s320/2%20ic_musica.png";
        break;


        case 'ciberseguridad':
        img =      'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjNmXSN1zJpZNWWuob8QRAD8wyiITSi3_4LAOMaOTtyQjK-c_dZIkfXJnp6jefbGc-LPKsK5f3M0EHu1-kUBaR5RvaNeRHUTO_YN_Fu3mtYVRB55h3iY5xRPOXgBx3nG8TfKcd8HJ9BEf9Xt8QEmPGN2V_nIqck4ywRl5xehDQ3PjOPEyR3LOncA3F4/s320/2%20ic_seg.png';
        break;

        case 'transporte':
          img ='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjWlk9NRCQV2K1tO4MwYdXDfJ61EZsML1UrcocNkUDxB8NsEQmDtUVEXTbBuhHH1sytgwrYcIKCFuv86I4NGKss-KF-KLk0PTkC9aRR-XvZSLrDrnGf-mQwXi2N-2NX5LBr_wRRG2g25g6IlUoyYBZHB_GQPIwrpJApz7XLeMuV4pp9Hz4HrfOrRGKm/s320/2%20ic_transp.png';
          break;

        case 'marketing':
          img = 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgGZVdCr6-OMohJMO4deCxSDwhxr-xFX9ZaPY9Wduf2gjWyiWapga8s16xS79Ns1Yqmx4bweod2q9j_sWACKLM8z5jAVOtPAwM7WyNWXyc84FQ4jYNyrRUhVc6RQYR2ZQfBLcU1rQMZZr_iNL1RHc93fgN2bFsL_3y_RvFW35ot5K6ns3y3q4rTukNt/s320/2%20ic_marketing.png';
          break;

        case 'trabajos':
          img =     'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhwQ4v9jwxIEIz6qz0L8kU5qoQcRMVHoq_CL7T1TELiO0gUCaCj_Ae8e3lqj4LPZb_nphLsl7Qt2Wmq5VWNZQF0hx7ZHtPgTJCvAY7MxxMSiqcIMkMc8kZJWuW0MdoXeU_UF0h5yy1FeJIk_V1BLu28hEcnYJq1cB3dn_E02nKkFIeoVpSMKvad6TED/s320/2%20ic_trabajos.png';
        break;
        case 'cocina':
        img =     'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjiXmKOliLo7iD2nsrim0fOq0jyZPsnOOmWPydHTG_7xE-ksDWemMe2T5n4K40xO2O9pZlf2fwrlPen2j2tq7VmfzHJG8sigXBe3zGN6Itic1gcaqyleMaOyJQjbWIsNsAfftolWjvN5w6PI4e_2WFz8eMXwWRjKZWNW9D-AndnJw1kFs83HAEW7i3q/s320/2%20ic_cocina.png'; break;

        case 'ingenieria':
        img =      'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiWThjrbgvv-T0draQfjbnOWDU4T7JoGIw7n02F1cQN330cYdedlloPGF7-L8wRiYiTofI-hAFgFSboxkKVTNVPHfCq6XHsM_0weBMOcZVZ_o8nsH-p3WTHDlnGZkZ27s6dl_t1NwmZEj6d7DskjEHFKKKzapJvj6e5FdgEoSou6gyQPS7D_YXctq2L/s320/2%20ic_ing.png';
      break;

        case 'agro':
        img =      'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiBvrOsX8vBZBKgR4xw75ZZ3sZ3M6zb_RpaNWAgRV_YTzG-F7lxtkjBfZaO70J7OqabB96Okvs9k1ZuqiI9wU2wSoe-uXmRXXTKMcOZKELYMlGfYjlMut6NJd9k5nUxG7mrB_h_UIu8GvOFaTUjZC1652D2lhONAjPwfGzB0qv0NuwJ-P3Y43pxa-O8/s320/2%20ic_agro.png';

        break;
    }

    return img;


  }
}