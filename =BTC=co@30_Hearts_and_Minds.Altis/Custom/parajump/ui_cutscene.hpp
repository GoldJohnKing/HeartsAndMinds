#include "ui_defines.hpp"

// Reference: KP-Liberation\Missionframework\ui\liberation_titles.hpp
class fasttravel {
    name = "fasttravel";
    duration = 4;
    idd = -1;
	movingEnable = true;
	controls[] = {
	    OuterBackground,GenericLabel111
	};
	class OuterBackground {
	    idc = -1;
	    type =  CT_STATIC ;
	    style = ST_LEFT;
	    colorText[] = COLOR_BLACK;
	    colorBackground[] = COLOR_BLACK;
	    font = FontM;
	    sizeEx = 0.023;
	    x = -3; y = -3;
	    w = 9;  h = 9;
	    text = "";
	};
	class GenericLabel111 {
	    idc = -1;
	    type =  CT_STATIC ;
	    style = ST_CENTER;
	    colorText[] = COLOR_WHITE;
	    colorBackground[] = COLOR_NOALPHA;
	    font = FontM;
	    sizeEx = 0.03;
	    x = 0; y = 0.75;
	    w = 1.0;  h = 0.1;
	    text = "正在跳伞……";
	};
};
