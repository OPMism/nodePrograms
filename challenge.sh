read n;
declare -A matrix
num_rows=63
num_columns=100

for ((i=1;i<=num_rows;i++)) do
    for ((j=1;j<=num_columns;j++)) do
        matrix[$i,$j]="_";
    done
done

function drawTree() {
    local x=$1;
    local y=$2;
    local depth=$3;
    local height=$4;

    if [ $depth -eq 0 ]; then
        return 1;
    fi
    local hh=$((height/2));
    for ((i=1;i<=hh;i++)) do
        matrix[$(($y+$i)),$x]="1";
        matrix[$(($y+$hh+$i)),$(($x-$i))]="1";
        matrix[$(($y+$hh+$i)),$(($x+$i))]="1";
    done
    drawTree $((x-hh)) $((y+height)) $((depth-1)) $hh;
    drawTree $((x+hh)) $((y+height)) $((depth-1)) $hh;
}

drawTree 50 0 $n 32

for ((i=num_rows;i>=0;i--)) do
    for ((j=1;j<=num_columns;j++)) do
        printf '%s' "${matrix[$i,$j]}";
    done
    printf '\n';
done
