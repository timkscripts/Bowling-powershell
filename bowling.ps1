# 2:15

class Game {
    $frame = @{}
    $current_subFrame;
    $current_frame;
    Game(){
         $this.current_subFrame = 0;
         $this.current_frame = 1;
    }
    [int]roll( $num ){
        $this.current_subFrame += 1;
        if ($this.current_subFrame -eq 1){
            # just rolled first number on a frame
            $this.frame[$this.current_frame] = @{}
    
    
        }
        write-host "--------------------------------"
        write-host "frame type is " $this.frame.getType()
        write-host "Current frame is " $this.current_frame
        write-host "current_subFrame is " $this.current_subFrame
        write-host "roll is is $num"
        $this.frame[$this.current_frame].add( $this.current_subFrame , $num )

        write-host ($this.frame.item($this.current_frame).item($this.current_subFrame) )
        $ctr = 1;
        $this.frame | foreach-object{
            write-host "^^^^^^^"
            $subCtr = 1
            $_.item($ctr) | foreach-object {
                write-host "#####"
                $_ | foreach-object{
                    write-host $_.value
                } 
                write-host $_.item($subCtr)
                $subCtr += 1
            }
            $ctr += 1;
        }
        write-host "Frame is " ($this.frame | out-string)
        $this.frame | foreach-object {
            write-host "frame value :"
            write-host $_
        }
        if (($this.current_subFrame -ge 2) -or ($num -eq 10)){
            $this.current_subFrame = 0;
            $this.current_frame += 1;

        }



        return $num
    }
    [int]score( ){
        [int]$totalScore = 0;
         for (($i = 1); $i -le $this.frame.count; $i++)
        {
            $currentFrameScore = 0
            for (($e = 1); $e -le $this.frame[$i].count; $e++)
            {
                write-host "value"
                write-host $this.frame[$i][$e]
                $currentFrameScore += $this.frame[$i][$e];
                if (($currentFrameScore -eq 10) -and ($e -eq 1)){
                    write-host "Strike"
                    try{
                    $currentFrameScore += $this.frame[$i+1][1];
                    $currentFrameScore += $this.frame[$i+1][2];
                    $currentFrameScore += $this.frame[$i+2][1];
                    $currentFrameScore += $this.frame[$i+2][2];
                    }catch{

                    }

                }
                if (($currentFrameScore -eq 10) -and ($e -eq 2)){
                    write-host "spare"
                    try{
                        $currentFrameScore += $this.frame[$i+1][1];
                        $currentFrameScore += $this.frame[$i+1][2];
                    } catch {

                    }

                }
            }
            $totalScore += $currentFrameScore
        }
        #$this.frame;#;dev.frame[2][2]


        return $totalScore
    }
    [System.Collections.Hashtable]frame( ){

        return $this.frame;
    }

}

$dev = [Game]::new()
$dev.roll(10)
$dev.roll(10)
$dev.roll(10)
$dev.roll(10)
$dev.roll(10)
$dev.roll(10)
$dev.roll(10)
$dev.roll(10)
$dev.roll(10)
$dev.roll(10)
$dev.roll(10)
$dev.score()

$dev = [Game]::new()
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)

$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)
$dev.roll(5)

$dev.score()

