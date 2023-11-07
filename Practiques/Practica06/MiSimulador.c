#include "CacheSim.h"

int cache[128];

void init_cache ()
{
  int i;
  for (i = 0; i < 128; ++i) {
    cache[i] = -1;
  }
}

void reference (unsigned int address, unsigned int LE)
{
    unsigned int byte;
    unsigned int bloque_m;
    unsigned int linea_mc;
    unsigned int tag;
    unsigned int miss;
    unsigned int lec_mp;
    unsigned int mida_lec_mp;
    unsigned int esc_mp;
    unsigned int mida_esc_mp;
    unsigned int replacement;
    unsigned int tag_out;
  
    byte = address & 31; // 5 ultims bits
    address = address/32; //treiem els 5 bits del final
  
    bloque_m = address & 134217727; //0x7FFFFFF

    linea_mc = address & 127; // bits 5 a 11 ambdos inclosos

    address = address/128;//treiem 7 bits més
    
    tag = address & 1048575; // la resta d'adreça desde bit 12 és tag
    
    if (LE) { //Escritura
        lec_mp = 0;
        mida_lec_mp = 0;
        tag_out = -1;
        esc_mp = 1;
        mida_esc_mp = 1; //acces a un byte
        replacement = 0;
        if (cache[linea_mc] == tag) miss = 0; //hit
        else miss = 1; //miss, no canviem la cache (write no allocate)     	
    }
    
    else { //Lectura
     	esc_mp = 0;
       	mida_esc_mp = 0;
        if (cache[linea_mc] == tag) { //hit
            miss = 0;
            tag_out = -1; //no substituim
            replacement = -1;
            lec_mp = 0;
            mida_lec_mp = 0;
        }
        else { //miss
          	miss = 1;
           	if (cache[linea_mc] == -1) { //no reemplacem res
          		tag_out = -1;
           		replacement = 0;
           		lec_mp = 1;
           		mida_lec_mp = 32; // 1 bloc = 32 bytes
           		cache[linea_mc] = tag;
           	}
           	else { //remplacem el bloc
           		tag_out = cache[linea_mc];
           		replacement = 1;
           		lec_mp = 1;
           		mida_lec_mp = 32; // 1 bloc = 32 bytes
           		cache[linea_mc] = tag;
           	}
        }
    }
    
    test_and_print (address, LE, byte, bloque_m, linea_mc, tag, miss, lec_mp, mida_lec_mp, esc_mp, mida_esc_mp, replacement, tag_out);
}

void final ()
{

}
 
