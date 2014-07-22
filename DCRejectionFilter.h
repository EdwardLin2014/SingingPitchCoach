//
//  DCRejectionFilter.h
//  SingingPitchCoach
//
//  Created by Edward on 22/7/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//
#ifndef __DCRejectionFilter__
#define __DCRejectionFilter__

#include <AudioToolbox/AudioToolbox.h>

class DCRejectionFilter
{
    public:
        DCRejectionFilter();
        ~DCRejectionFilter();
    
        void ProcessInplace(Float32* inData, UInt32 numFrames);

    private:
        Float32 mY1;
        Float32 mX1;
};

#endif /* defined(__aurioTouch3__DCRejectionFilter__) */
