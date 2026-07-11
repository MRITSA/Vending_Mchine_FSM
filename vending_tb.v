module vending_machine(input clk,reset,cancel,
input [1:0] coin,
output reg dispense,
output reg [3:0] change);

parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;

reg [1:0] state, next_state;
always@(posedge clk or posedge reset)
begin
    if(reset)
      state<=s0;
      else
      state<=next_state;
end

always@(*)
  begin
    next_state=state;
    dispense=0;
    change=0;

    case(state)

    s0:
    begin
        if(cancel) begin
            next_state=s0;
            change=0;
        end
        else begin
        case(coin)
        2'b00:next_state=s0;
        2'b01:next_state=s1;
        2'b10:next_state=s2;
        default:next_state=s0;
        endcase
    end
    end

    s1:
    begin
        if(cancel) begin
            next_state=s0;
            change=5;
        end
        else begin
        case(coin)
        2'b00:begin
            next_state=s0;
            change=5;
           end
           2'b01:next_state=s2;
           2'b10:begin
            dispense=1;
            change=0;
            next_state=s0;
              end
              default:next_state=s1;
        endcase
    end
    end

    s2:
    begin
        if(cancel) begin
            next_state=s0;
            change=10;
        end
        else begin
        case(coin)
        2'b00:begin
            next_state=s0;
            change=10;
        end
        2'b01:begin
            dispense=1;
            change=0;
            next_state=s0;
        end
        2'b10:begin
            dispense=1;
            change=5;
            next_state=s0;
        end
        default:next_state=s2;
        endcase
    end    
    end
    
    default:next_state=s0;
    endcase
    end
endmodule
