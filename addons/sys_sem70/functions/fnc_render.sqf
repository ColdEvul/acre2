/*
 * Author: ACRE2Team
 * SHORT DESCRIPTION
 *
 * Arguments:
 * 0: ARGUMENT ONE <TYPE>
 * 1: ARGUMENT TWO <TYPE>
 *
 * Return Value:
 * RETURN VALUE <TYPE>
 *
 * Example:
 * [ARGUMENTS] call acre_COMPONENT_fnc_FUNCTIONNAME
 *
 * Public: No
 */
#include "script_component.hpp"
#define RADIO_CTRL(var1) (_display displayCtrl var1)

params["_display"];


//private _channelKnobPosition = GET_STATE(channelKnobPosition);
private _mainKnobPosition = GET_STATE(mainKnobPosition);
private _functionKnobPosition = GET_STATE(functionKnobPosition);
//private _manualChannelSelection = GET_STATE(manualChannelSelection);
private _channelStepPosition = GET_STATE(channelStepPosition);
private _volumeKnobPosition = GET_STATE(volumeKnobPosition);
private _kHzKnobPosition = GET_STATE(kHzKnobPosition);
private _MHzKnobPostion = GET_STATE(MHzKnobPostion);

// Main knob
private _mainImages = [
    QUOTE(PATHTOF(Data\knobs\main\lstg_aus.paa)),
    QUOTE(PATHTOF(Data\knobs\main\lstg_kl.paa)),
    QUOTE(PATHTOF(Data\knobs\main\lstg_gr.paa))
];

// Function knob
private _functionImages = [
    QUOTE(PATHTOF(Data\knobs\function\bs_akw_rl.paa)),
    QUOTE(PATHTOF(Data\knobs\function\bs_akw.paa)),
    QUOTE(PATHTOF(Data\knobs\function\bs_hw.paa)),
    QUOTE(PATHTOF(Data\knobs\function\bs_rsp.paa)),
    QUOTE(PATHTOF(Data\knobs\function\bs_hw_rl.paa))
];

// Channel Step knob
private _channelStepImages = [
    QUOTE(PATHTOF(Data\knobs\cs\ka_25mhz_pil.paa)),
    QUOTE(PATHTOF(Data\knobs\cs\ka_25mhz.paa)),
    QUOTE(PATHTOF(Data\knobs\cs\ka_50mhz.paa)),
    QUOTE(PATHTOF(Data\knobs\cs\ka_50mhz_pil.paa))
];

// Volume knob
private _volImages = [
    QUOTE(PATHTOF(Data\knobs\volume\vol_100.paa)),
    QUOTE(PATHTOF(Data\knobs\volume\vol_80.paa)),
    QUOTE(PATHTOF(Data\knobs\volume\vol_60.paa)),
    QUOTE(PATHTOF(Data\knobs\volume\vol_40.paa)),
    QUOTE(PATHTOF(Data\knobs\volume\vol_20.paa)),
    QUOTE(PATHTOF(Data\knobs\volume\vol_00.paa))
];

// kHz Knob
private _kHzKnobImages = [
    QUOTE(PATHTOF(Data\knobs\khz\khz_0.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_1.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_2.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_3.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_4.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_5.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_6.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_7.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_8.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_9.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_10.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_11.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_12.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_13.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_14.paa)),
    QUOTE(PATHTOF(Data\knobs\khz\khz_15.paa))
];

// MHz Knob
private _MHzKnobImages = [
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_0.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_1.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_2.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_3.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_4.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_5.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_6.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_7.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_8.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_9.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_10.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_11.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_12.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_13.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_14.paa)),
    QUOTE(PATHTOF(Data\knobs\mhz\mhz_15.paa))
];



RADIO_CTRL(106) ctrlSetText (_volImages select _volumeKnobPosition);


//display
[_display] call FUNC(renderDisplay);

TRACE_3("rendering", _currentChannel, _currentVolume, acre_sys_radio_currentRadioDialog);
true