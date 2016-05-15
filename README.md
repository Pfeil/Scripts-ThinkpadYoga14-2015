# Pen&Touch script for Thinkpad Yoga 14 (2015) with Ubuntu

> THIS IS IN A PROTOTYPE KIND OF STATE!
> THINK, READ AND CUSTOMIZE BEFORE USE!
> IT IS A PRIVATE PROJECT THAT FOCUSES ONLY ON MY NOTEBOOK MODEL!
> (though you may add support for other models/operating systems by opening a pull request)
> IN CASE THIS BREAKS YOU GET TO KEEP BOTH PARTS.

Those script enables and controls hardware that is not supported by default. The project was initiated on Ubuntu 14.04 and is now developed on Ubuntu 16.04. Some parts may be untested on Ubuntu 16.04 yet.

The system I use it for is a Thinkpad Yoga 14, bought in 2015.

## Usage

    initHardware.sh [functionality]

Functionalities are:

- `pen` (pen-only mode)
- `hybrid` (pen and touch mode, **default**)
- no parameter (just set up hardware, with hybrid as default)

`pen` and `hybrid` mode are both not needed since Ubuntu 16.04 for my use cases, though. I just use it to adjust some parameters for the red cursor stick and enable basic touch gestures.

## Dependencies

Ubuntu (16.04) default stuff:

    bash, xinput, synclient, notify-send

## Todo / Contribution

Contribution is welcome, just use github. I.e. open an issue to get in contact.

Missing functionality:

- no tilt screen (I think the hardware is capable to detect this)
- the lock button on the right side of the notebook is recognized as windows/super button, so it does not lock anything. I guess it's supposed to lock screen tilting, which does not work yet anyway.
