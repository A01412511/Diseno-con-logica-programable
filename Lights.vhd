library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity Lights is
		port (Clk, reset, rt, lt,int,entrada: in STD_LOGIC;
				salida : out STD_LOGIC;
				LD, RD : out STD_LOGIC_VECTOR(3 downto 0)); --hacer salida de vector
end Lights;



architecture A1 of Lights is

type State is (S0,IS0,IS1,IS2,IS3,RS0, RS1, RS2, RS3, LS0,LS1,LS2,LS3);			-- Declaración de tipo de dato State con 

signal CurrentState, NextState: State;	-- Señales de tipo State

signal temporal: STD_LOGIC;
    signal contador: integer range 0 to 9999999 := 0;
    
begin
    divisor_frecuencia: process (reset, Clk) begin
        if (reset = '1') then
            temporal <= '0';
            contador <= 0;
            CurrentState <= S0;
        elsif rising_edge(Clk) then
            if (contador = 9999999) then
                temporal <= NOT(temporal);
                contador <= 0;
                CurrentState <= NextState;
            else
                contador <= contador+1;
            end if;
        end if;
end process;
     
    salida <= temporal;
    
	Combinational: process (CurrentState, rt,lt,int) -- Lógica combinacional de la FSM
	begin
		NextState <= CurrentState;
			RD(0) <= '0';
			RD(1) <= '0';
			RD(2) <= '0';
			RD(3) <= '0';
			LD(0) <= '0';
			LD(1) <= '0';
			LD(2) <= '0';
			LD(3) <= '0';
		
      case CurrentState is
        
		when S0 =>						-- Estado S0
        		RD(0) <= '0';
				RD(1) <= '0';
				RD(2) <= '0';
				RD(3) <= '0';
				LD(0) <= '0';
				LD(1) <= '0';
				LD(2) <= '0';
				LD(3) <= '0';
            
				if int = '1' then
					NextState <= IS0;		
            	else
            		if rt = '1' then
                		NextState <= RS0;
						else
                		NextState <= LS0;
						end if;
				end if;
            
		when IS0 =>	
				RD(0) <= '0';
				RD(1) <= '0';
				RD(2) <= '0';
				RD(3) <= '1';
				LD(0) <= '1';
				LD(1) <= '0';
				LD(2) <= '0';
				LD(3) <= '0';
				
			if int = '1' then
				NextState <= IS1;		
         else
            	if rt = '1' then
                	NextState <= RS0;
                elsif lt = '1' then
               		NextState <= LS0;
                else
                	NextState <= S0;
					end if;
			end if;
            
		when IS1 =>		
				RD(0) <= '0';
				RD(1) <= '0';
				RD(2) <= '1';
				RD(3) <= '1';
				LD(0) <= '1';
				LD(1) <= '1';
				LD(2) <= '0';
				LD(3) <= '0';
				
			if int = '1' then
				NextState <= IS2;		
            else
            	if rt = '1' then
                	NextState <= RS0;
                elsif lt = '1' then
                	NextState <= LS0;
                else
                	NextState <= S0;
					end if;
				end if;
            
		when IS2 =>
				RD(0) <= '0';
				RD(1) <= '1';
				RD(2) <= '1';
				RD(3) <= '1';
				LD(0) <= '1';
				LD(1) <= '1';
				LD(2) <= '1';
				LD(3) <= '0';
				
			if int = '1' then
				NextState <= IS3;		
				else	
            	if rt = '1' then
                	NextState <= RS0;
               elsif lt = '1'then
                	NExtState <= LS0;
               else
                	NextState <= S0;
					end if;
                   
				end if;
				
		when IS3 =>
				RD(0) <= '1';
				RD(1) <= '1';
				RD(2) <= '1';
				RD(3) <= '1';
				LD(0) <= '1';
				LD(1) <= '1';
				LD(2) <= '1';
				LD(3) <= '1';
				
			if int = '1' then
				NextState <= IS0;		
				else	
            	if rt = '1' then
                	NextState <= RS0;
               elsif lt = '1'then
                	NExtState <= LS0;
               else
                	NextState <= S0;
					end if;
                   
				end if;
				
			when RS0 =>
				RD(0) <= '0';
				RD(1) <= '0';
				RD(2) <= '0';
				RD(3) <= '1';
				LD(0) <= '0';
				LD(1) <= '0';
				LD(2) <= '0';
				LD(3) <= '0';
				
			if int = '1' then
				NextState <= IS0;		
				else	
            	if rt = '1' then
                	NextState <= RS1;
               elsif lt = '1'then
                	NExtState <= LS0;
               else
                	NextState <= S0;
					end if;
                   
				end if;
				
				
			when RS1 =>
				RD(0) <= '0';
				RD(1) <= '0';
				RD(2) <= '1';
				RD(3) <= '1';
				LD(0) <= '0';
				LD(1) <= '0';
				LD(2) <= '0';
				LD(3) <= '0';
				
			if int = '1' then
				NextState <= IS0;		
				else	
            	if rt = '1' then
                	NextState <= RS2;
               elsif lt = '1'then
                	NExtState <= LS0;
               else
                	NextState <= S0;
					end if;
                   
				end if;
				
			when RS2 =>
				RD(0) <= '0';
				RD(1) <= '1';
				RD(2) <= '1';
				RD(3) <= '1';
				LD(0) <= '0';
				LD(1) <= '0';
				LD(2) <= '0';
				LD(3) <= '0';
				
			if int = '1' then
				NextState <= IS0;		
				else	
            	if rt = '1' then
                	NextState <= RS3;
               elsif lt = '1'then
                	NExtState <= LS0;
               else
                	NextState <= S0;
					end if;
                   
				end if;
				
				
			when RS3 =>
				RD(0) <= '1';
				RD(1) <= '1';
				RD(2) <= '1';
				RD(3) <= '1';
				LD(0) <= '0';
				LD(1) <= '0';
				LD(2) <= '0';
				LD(3) <= '0';
				
			if int = '1' then
				NextState <= IS0;		
				else	
            	if rt = '1' then
                	NextState <= RS0;
               elsif lt = '1'then
                	NExtState <= LS0;
               else
                	NextState <= S0;
					end if;
                   
				end if;
				
				
			when LS0 =>
				RD(0) <= '0';
				RD(1) <= '0';
				RD(2) <= '0';
				RD(3) <= '0';
				LD(0) <= '1';
				LD(1) <= '0';
				LD(2) <= '0';
				LD(3) <= '0';
				
			if int = '1' then
				NextState <= IS0;		
				else	
            	if rt = '1' then
                	NextState <= RS0;
               elsif lt = '1'then
                	NExtState <= LS1;
               else
                	NextState <= S0;
					end if;
                   
				end if;
				
				
			when LS1 =>
				RD(0) <= '0';
				RD(1) <= '0';
				RD(2) <= '0';
				RD(3) <= '0';
				LD(0) <= '1';
				LD(1) <= '1';
				LD(2) <= '0';
				LD(3) <= '0';
				
			if int = '1' then
				NextState <= IS0;		
				else	
            	if rt = '1' then
                	NextState <= RS0;
               elsif lt = '1'then
                	NExtState <= LS2;
               else
                	NextState <= S0;
					end if;
                   
				end if;
				
				
			when LS2 =>
				RD(0) <= '0';
				RD(1) <= '0';
				RD(2) <= '0';
				RD(3) <= '0';
				LD(0) <= '1';
				LD(1) <= '1';
				LD(2) <= '1';
				LD(3) <= '0';
				
			if int = '1' then
				NextState <= IS0;		
				else	
            	if rt = '1' then
                	NextState <= RS0;
               elsif lt = '1'then
                	NExtState <= LS3;
               else
                	NextState <= S0;
					end if;
                   
				end if;
				
			when LS3 =>
				RD(0) <= '0';
				RD(1) <= '0';
				RD(2) <= '0';
				RD(3) <= '0';
				LD(0) <= '1';
				LD(1) <= '1';
				LD(2) <= '1';
				LD(3) <= '1';
				
			if int = '1' then
				NextState <= IS0;		
				else	
            	if rt = '1' then
                	NextState <= RS0;
               elsif lt = '1'then
                	NExtState <= LS0;
               else
                	NextState <= S0;
					end if;
                   
				end if;
            
		when others =>							
			NextState <= S0;
		end case;
        
	end process Combinational;
    			
    
end architecture A1;