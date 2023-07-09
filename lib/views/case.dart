String widget_decisao(String nome) {
  String? img = '';
  switch (nome) {
    case 'MILHO':
      img = 'assets/img/milho.jpg';
      break;
    case 'SOJA':
      img = 'assets/img/soja.jpg';
      break;
    case 'TRIGO':
      img = 'assets/img/trigo.jpg';
      break;
    case 'FEIJÃO':
      img = 'assets/img/feijao.jpg';
      break;
    case 'FEIJÃO-CAUPI':
      img = 'assets/img/caupi.jpg';
      break;
    case 'CROTALÁRIA-SPECTABILIS':
      img = 'assets/img/crolataria.jpg';
      break;
    case 'AMENDOIM':
      img = 'assets/img/amendoim.jpg';
      break;
    case 'ALFAFA':
      img = 'assets/img/alfafa.webp';
      break;
    case 'CORNICHÃO':
      img = 'assets/img/cornichao.webp';
      break;
    case 'FEIJÃO-GUANDU':
    case 'GUANDU':
      img = 'assets/img/guandu.jpg';
      break;
    case 'FEIJÃO DE PORCO':
      img = 'assets/img/feijao_porco.jpg';
      break;
    case 'TREVO-SUBTERRÂNEO':
      img = 'assets/img/trevo_sub.jpg';
      break;
    case 'ERVILHA':
      img = 'assets/img/ervilha.jpg';
      break;
    case 'GRÃO DE BICO':
      img = 'assets/img/grao_bico.jpg';
      break;
    case 'TREVO VERMELHO':
      img = 'assets/img/trevo_vermelho.jpg';
      break;
    case 'MUCUNA PRETA':
      img = 'assets/img/mucuna_preta.jpg';
      break;
    case 'TREVO-VESICULOSO':
    case 'TREVO VESICULOSO':
      img = 'assets/img/trevo_vesiculoso.jpg';
      break;
    case 'ARROZ':
      img = 'assets/img/arroz.jpg';
      break;
    case ('TREVO-BRANCO'):
    case ('TREVO BRANCO'):
      img = 'assets/img/trevo_branco.jpg';
      break;
    case 'ALFACE':
      img = 'assets/img/alface.jpg';
      break;
    case 'CAPIM-MARANDU':
      img = 'assets/img/capim_marandu.jpg';
      break;
    case 'LENTILHA':
      img = 'assets/img/lentilha.jpg';
      break;
    case 'CROTALÁRIA-JUNCEA':
      img = 'assets/img/crotalaria_juncea.jpg';
      break;
    case 'BRAQUIÁRIA BRIZANTA':
      img = 'assets/img/braquiaria_bizanta.jpg';
      break;
    case 'TREMOCEIRO':
      img = 'assets/img/tremoceiro.jpeg';
      break;
    case 'EUCALIPTO':
      img = 'assets/img/eucalipto.jpg';
      break;
    case 'CANA DE AÇÚCAR':
    case 'CANA-DE-AÇÚCAR':
      img = 'assets/img/cana_acucar.webp';
      break;
    case 'ESTILOSANTES':
      img = 'assets/img/estilosante.webp';
      break;
    case 'LEUCAENA':
    case 'LEUCENA':
      img = 'assets/img/leucema.jpg';
      break;
    case 'JACARANDÁ-DA-BAÍA':
      img = 'assets/img/jacarand_da_bahia.webp';
      break;
    case 'ACÁCIA MANGIUM':
      img = 'assets/img/acacia_mangium.jpeg';
      break;
    case 'ACÁCIA':
      img = 'assets/img/acacia.jpg';
      break;
    case 'SOJA PERENE':
      img = 'assets/img/soja_perene.jpg';
      break;
    default:
      img = 'assets/img/carne.jpg';
      break;
  }
  return img;
}
