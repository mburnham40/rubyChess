

class ChessPiece
    attr_accessor :this_grid, :x, :y, :piece
    def initialize(this_grid, y, x, symbol_string)
        @x = x 
        @y = y 
        @piece = symbol_string.encode('utf-8')
        this_grid[@y][@x] = @piece + " "
    end

    def can_move(this_grid)
        return true
    end
end


class WhiteKing < ChessPiece
    def can_move(this_grid)
        if (this_grid.x == (@x + 1)) && (this_grid.y == @y)
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == @y)
            return true
        elsif (this_grid.x == @x) && (this_grid.y == (@y + 1))
            return true
        elsif (this_grid.x == @x) && (this_grid.y == (@y - 1))
            return true
        elsif (this_grid.x == (@x + 1)) && (this_grid.y == (@y + 1))
            return true
        elsif (this_grid.x == (@x + 1)) && (this_grid.y == (@y - 1))
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y + 1))
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y - 1))
            return true
        else
            return false
        end
    end
end

class WhiteQueen < ChessPiece
    def can_move(this_grid)
        wSquare = "\u25A0"
        wSquare = wSquare.encode('utf-8')
        bSquare = "\u25A1"
        bSquare = bSquare.encode('utf-8')

        comp_x = this_grid.x - @x 
        comp_y = this_grid.y - @y 

        diag_x = comp_x
        diag_y = comp_y

        if (comp_x < 0)
            diag_x *= -1
        end

        if (comp_y < 0)
            diag_y *= -1
        end

        if (this_grid.x == @x) && (this_grid.y != @y)
            if (this_grid.y > @y)
                y_ind = (@y + 1) 
                while (this_grid.y > y_ind)
                    if !((this_grid.grid[y_ind][@x].include? wSquare) || (this_grid.grid[y_ind][@x].include? bSquare))
                        return false
                    end
                    y_ind += 1
                end
                return true
            elsif (this_grid.y < @y)
                y_ind = (@y - 1)
                while (this_grid.y < y_ind)
                    if !((this_grid.grid[y_ind][@x].include? wSquare) || (this_grid.grid[y_ind][@x].include? bSquare))
                        return false
                    end
                    y_ind -= 1
                end
                return true
            else
                return false
            end
        elsif (this_grid.x != @x) && (this_grid.y == @y)
            if (this_grid.x > @x)
                x_ind = (@x + 1) 
                while (this_grid.x > x_ind)
                    if !((this_grid.grid[@y][x_ind].include? wSquare) || (this_grid.grid[@y][x_ind].include? bSquare))
                        return false
                    end
                    x_ind += 1
                end
                return true
            elsif (this_grid.x < @x)
                x_ind = (@x - 1)
                while (this_grid.x < x_ind)
                    if !((this_grid.grid[@y][x_ind].include? wSquare) || (this_grid.grid[@y][x_ind].include? bSquare))
                        return false
                    end
                    x_ind -= 1
                end
                return true
            else
                return false
            end
        
        elsif (comp_x > 0) && (comp_y > 0) && (diag_x == diag_y)
            y_ind = (@y + 1)
            x_ind = (@x + 1)
            while ((this_grid.x > x_ind) && (this_grid.y > y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind += 1
                x_ind += 1
            end
            return true
        elsif (comp_x < 0) && (comp_y > 0) && (diag_x == diag_y)
            y_ind = (@y + 1)
            x_ind = (@x - 1)
            while ((this_grid.x < x_ind) && (this_grid.y > y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind += 1
                x_ind -= 1
            end
            return true
        elsif (comp_x > 0) && (comp_y < 0) && (diag_x == diag_y)
            y_ind = (@y - 1)
            x_ind = (@x + 1)
            while ((this_grid.x > x_ind) && (this_grid.y < y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind -= 1
                x_ind += 1
            end
            return true
        elsif (comp_x < 0) && (comp_y < 0) && (diag_x == diag_y)
            y_ind = (@y - 1)
            x_ind = (@x - 1)
            while ((this_grid.x < x_ind) && (this_grid.y < y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind -= 1
                x_ind -= 1
            end
            return true
        end

    end
end

class WhiteRook < ChessPiece
    def can_move(this_grid)
        wSquare = "\u25A0"
        wSquare = wSquare.encode('utf-8')
        bSquare = "\u25A1"
        bSquare = bSquare.encode('utf-8')

        if (this_grid.x == @x) && (this_grid.y != @y)
            if (this_grid.y > @y)
                y_ind = (@y + 1) 
                while (this_grid.y > y_ind)
                    if !((this_grid.grid[y_ind][@x].include? wSquare) || (this_grid.grid[y_ind][@x].include? bSquare))
                        return false
                    end
                    y_ind += 1
                end
                return true
            elsif (this_grid.y < @y)
                y_ind = (@y - 1)
                while (this_grid.y < y_ind)
                    if !((this_grid.grid[y_ind][@x].include? wSquare) || (this_grid.grid[y_ind][@x].include? bSquare))
                        return false
                    end
                    y_ind -= 1
                end
                return true
            else
                return false
            end
        elsif (this_grid.x != @x) && (this_grid.y == @y)
            if (this_grid.x > @x)
                x_ind = (@x + 1) 
                while (this_grid.x > x_ind)
                    if !((this_grid.grid[@y][x_ind].include? wSquare) || (this_grid.grid[@y][x_ind].include? bSquare))
                        return false
                    end
                    x_ind += 1
                end
                return true
            elsif (this_grid.x < @x)
                x_ind = (@x - 1)
                while (this_grid.x < x_ind)
                    if !((this_grid.grid[@y][x_ind].include? wSquare) || (this_grid.grid[@y][x_ind].include? bSquare))
                        return false
                    end
                    x_ind -= 1
                end
                return true
            else
                return false
            end
        else
            return false
        end
    end
end

class WhiteBishop < ChessPiece
    def can_move(this_grid)
        wSquare = "\u25A0"
        wSquare = wSquare.encode('utf-8')
        bSquare = "\u25A1"
        bSquare = bSquare.encode('utf-8')

        comp_x = this_grid.x - @x 
        comp_y = this_grid.y - @y 

        diag_x = comp_x
        diag_y = comp_y

        if (comp_x < 0)
            diag_x *= -1
        end

        if (comp_y < 0)
            diag_y *= -1
        end

        if (diag_x != diag_y)
            return false
        elsif (comp_x > 0) && (comp_y > 0)
            y_ind = (@y + 1)
            x_ind = (@x + 1)
            while ((this_grid.x > x_ind) && (this_grid.y > y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind += 1
                x_ind += 1
            end
            return true
        elsif (comp_x < 0) && (comp_y > 0)
            y_ind = (@y + 1)
            x_ind = (@x - 1)
            while ((this_grid.x < x_ind) && (this_grid.y > y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind += 1
                x_ind -= 1
            end
            return true
        elsif (comp_x > 0) && (comp_y < 0)
            y_ind = (@y - 1)
            x_ind = (@x + 1)
            while ((this_grid.x > x_ind) && (this_grid.y < y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind -= 1
                x_ind += 1
            end
            return true
        elsif (comp_x < 0) && (comp_y < 0)
            y_ind = (@y - 1)
            x_ind = (@x - 1)
            while ((this_grid.x < x_ind) && (this_grid.y < y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind -= 1
                x_ind -= 1
            end
            return true
        end

    end
end

class WhiteKnight < ChessPiece
    def can_move(this_grid)
        if (this_grid.x == (@x + 1)) && (this_grid.y == (@y + 2))
            return true
        elsif (this_grid.x == (@x + 1)) && (this_grid.y == (@y - 2))
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y + 2))
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y - 2))
            return true
        elsif (this_grid.x == (@x + 2)) && (this_grid.y == (@y + 1))
            return true
        elsif (this_grid.x == (@x + 2)) && (this_grid.y == (@y - 1))
            return true
        elsif (this_grid.x == (@x - 2)) && (this_grid.y == (@y + 1))
            return true
        elsif (this_grid.x == (@x - 2)) && (this_grid.y == (@y - 1))
            return true
        else
            return false
        end
    end
end

class WhitePawn < ChessPiece
    attr_accessor :fresh, :x, :y, :piece
    def initialize(this_grid, y, x, symbol_string)
        super
        @fresh = true
    end

    def can_move(this_grid, target_square)

        if fresh
            if (this_grid.x == @x) && (this_grid.y == (@y - 1)) && (target_square == nil)
                @fresh = false
                return true
            elsif (this_grid.x == @x) && (this_grid.y == (@y - 2)) && (target_square == nil)
                @fresh = false
                return true
            elsif ((target_square != nil) && (this_grid.x == (@x + 1)) && (this_grid.y == (@y - 1)))
                @fresh = false
                return true
            elsif ((target_square != nil) && (this_grid.x == (@x - 1)) && (this_grid.y == (@y - 1)))
                @fresh = false
                return true
            else
                return false
            end
        elsif !fresh 
            if (this_grid.x == @x) && (this_grid.y == (@y - 1)) && (target_square == nil)
                return true
            elsif ((target_square != nil) && (this_grid.x == (@x + 1)) && (this_grid.y == (@y - 1)))
                return true
            elsif ((target_square != nil) && (this_grid.x == (@x - 1)) && (this_grid.y == (@y - 1)))
                return true
            else
                return false
            end
        end
    end
end

class BlackKing < ChessPiece
    def can_move(this_grid)
        if (this_grid.x == (@x + 1)) && (this_grid.y == @y)
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == @y)
            return true
        elsif (this_grid.x == @x) && (this_grid.y == (@y + 1))
            return true
        elsif (this_grid.x == @x) && (this_grid.y == (@y - 1))
            return true
        elsif (this_grid.x == (@x + 1)) && (this_grid.y == (@y + 1))
            return true
        elsif (this_grid.x == (@x + 1)) && (this_grid.y == (@y - 1))
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y + 1))
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y - 1))
            return true
        else
            return false
        end
    end
end

class BlackQueen < ChessPiece
    def can_move(this_grid)
        wSquare = "\u25A0"
        wSquare = wSquare.encode('utf-8')
        bSquare = "\u25A1"
        bSquare = bSquare.encode('utf-8')

        comp_x = this_grid.x - @x 
        comp_y = this_grid.y - @y 

        diag_x = comp_x
        diag_y = comp_y

        if (comp_x < 0)
            diag_x *= -1
        end

        if (comp_y < 0)
            diag_y *= -1
        end

        if (this_grid.x == @x) && (this_grid.y != @y)
            if (this_grid.y > @y)
                y_ind = (@y + 1) 
                while (this_grid.y > y_ind)
                    if !((this_grid.grid[y_ind][@x].include? wSquare) || (this_grid.grid[y_ind][@x].include? bSquare))
                        return false
                    end
                    y_ind += 1
                end
                return true
            elsif (this_grid.y < @y)
                y_ind = (@y - 1)
                while (this_grid.y < y_ind)
                    if !((this_grid.grid[y_ind][@x].include? wSquare) || (this_grid.grid[y_ind][@x].include? bSquare))
                        return false
                    end
                    y_ind -= 1
                end
                return true
            else
                return false
            end
        elsif (this_grid.x != @x) && (this_grid.y == @y)
            if (this_grid.x > @x)
                x_ind = (@x + 1) 
                while (this_grid.x > x_ind)
                    if !((this_grid.grid[@y][x_ind].include? wSquare) || (this_grid.grid[@y][x_ind].include? bSquare))
                        return false
                    end
                    x_ind += 1
                end
                return true
            elsif (this_grid.x < @x)
                x_ind = (@x - 1)
                while (this_grid.x < x_ind)
                    if !((this_grid.grid[@y][x_ind].include? wSquare) || (this_grid.grid[@y][x_ind].include? bSquare))
                        return false
                    end
                    x_ind -= 1
                end
                return true
            else
                return false
            end
        
        elsif (comp_x > 0) && (comp_y > 0) && (diag_x == diag_y)
            y_ind = (@y + 1)
            x_ind = (@x + 1)
            while ((this_grid.x > x_ind) && (this_grid.y > y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind += 1
                x_ind += 1
            end
            return true
        elsif (comp_x < 0) && (comp_y > 0) && (diag_x == diag_y)
            y_ind = (@y + 1)
            x_ind = (@x - 1)
            while ((this_grid.x < x_ind) && (this_grid.y > y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind += 1
                x_ind -= 1
            end
            return true
        elsif (comp_x > 0) && (comp_y < 0) && (diag_x == diag_y)
            y_ind = (@y - 1)
            x_ind = (@x + 1)
            while ((this_grid.x > x_ind) && (this_grid.y < y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind -= 1
                x_ind += 1
            end
            return true
        elsif (comp_x < 0) && (comp_y < 0) && (diag_x == diag_y)
            y_ind = (@y - 1)
            x_ind = (@x - 1)
            while ((this_grid.x < x_ind) && (this_grid.y < y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind -= 1
                x_ind -= 1
            end
            return true
        end

    end
end

class BlackRook < ChessPiece
    def can_move(this_grid)
        wSquare = "\u25A0"
        wSquare = wSquare.encode('utf-8')
        bSquare = "\u25A1"
        bSquare = bSquare.encode('utf-8')

        if (this_grid.x == @x) && (this_grid.y != @y)
            if (this_grid.y > @y)
                y_ind = (@y + 1) 
                while (this_grid.y > y_ind)
                    if !((this_grid.grid[y_ind][@x].include? wSquare) || (this_grid.grid[y_ind][@x].include? bSquare))
                        return false
                    end
                    y_ind += 1
                end
                return true
            elsif (this_grid.y < @y)
                y_ind = (@y - 1)
                while (this_grid.y < y_ind)
                    if !((this_grid.grid[y_ind][@x].include? wSquare) || (this_grid.grid[y_ind][@x].include? bSquare))
                        return false
                    end
                    y_ind -= 1
                end
                return true
            else
                return false
            end
        elsif (this_grid.x != @x) && (this_grid.y == @y)
            if (this_grid.x > @x)
                x_ind = (@x + 1) 
                while (this_grid.x > x_ind)
                    if !((this_grid.grid[@y][x_ind].include? wSquare) || (this_grid.grid[@y][x_ind].include? bSquare))
                        return false
                    end
                    x_ind += 1
                end
                return true
            elsif (this_grid.x < @x)
                x_ind = (@x - 1)
                while (this_grid.x < x_ind)
                    if !((this_grid.grid[@y][x_ind].include? wSquare) || (this_grid.grid[@y][x_ind].include? bSquare))
                        return false
                    end
                    x_ind -= 1
                end
                return true
            else
                return false
            end
        else
            return false
        end
    end
end

class BlackBishop < ChessPiece
    def can_move(this_grid)
        wSquare = "\u25A0"
        wSquare = wSquare.encode('utf-8')
        bSquare = "\u25A1"
        bSquare = bSquare.encode('utf-8')

        comp_x = this_grid.x - @x 
        comp_y = this_grid.y - @y 

        diag_x = comp_x
        diag_y = comp_y

        if (comp_x < 0)
            diag_x *= -1
        end

        if (comp_y < 0)
            diag_y *= -1
        end

        if (diag_x != diag_y)
            return false
        elsif (comp_x > 0) && (comp_y > 0)
            y_ind = (@y + 1)
            x_ind = (@x + 1)
            while ((this_grid.x > x_ind) && (this_grid.y > y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind += 1
                x_ind += 1
            end
            return true
        elsif (comp_x < 0) && (comp_y > 0)
            y_ind = (@y + 1)
            x_ind = (@x - 1)
            while ((this_grid.x < x_ind) && (this_grid.y > y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind += 1
                x_ind -= 1
            end
            return true
        elsif (comp_x > 0) && (comp_y < 0)
            y_ind = (@y - 1)
            x_ind = (@x + 1)
            while ((this_grid.x > x_ind) && (this_grid.y < y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind -= 1
                x_ind += 1
            end
            return true
        elsif (comp_x < 0) && (comp_y < 0)
            y_ind = (@y - 1)
            x_ind = (@x - 1)
            while ((this_grid.x < x_ind) && (this_grid.y < y_ind))
                if !((this_grid.grid[y_ind][x_ind].include? wSquare) || (this_grid.grid[y_ind][x_ind].include? bSquare))
                    return false
                end
                y_ind -= 1
                x_ind -= 1
            end
            return true
        end

    end
end

class BlackKnight < ChessPiece
    def can_move(this_grid)
        if (this_grid.x == (@x + 1)) && (this_grid.y == (@y + 2))
            return true
        elsif (this_grid.x == (@x + 1)) && (this_grid.y == (@y - 2))
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y + 2))
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y - 2))
            return true
        elsif (this_grid.x == (@x + 2)) && (this_grid.y == (@y + 1))
            return true
        elsif (this_grid.x == (@x + 2)) && (this_grid.y == (@y - 1))
            return true
        elsif (this_grid.x == (@x - 2)) && (this_grid.y == (@y + 1))
            return true
        elsif (this_grid.x == (@x - 2)) && (this_grid.y == (@y - 1))
            return true
        else
            return false
        end
    end
end

class BlackPawn < ChessPiece
    attr_accessor :fresh, :x, :y, :piece
    def initialize(this_grid, y, x, symbol_string)
        super
        @fresh = true
    end

    def can_move(this_grid, target_square)

        if fresh
            if (this_grid.x == @x) && (this_grid.y == (@y + 1)) && (target_square == nil)
                @fresh = false
                return true
            elsif (this_grid.x == @x) && (this_grid.y == (@y + 2)) && (target_square == nil)
                @fresh = false
                return true
            elsif ((target_square != nil) && (this_grid.x == (@x + 1)) && (this_grid.y == (@y + 1)))
                @fresh = false
                return true
            elsif ((target_square != nil) && (this_grid.x == (@x - 1)) && (this_grid.y == (@y + 1)))
                @fresh = false
                return true
            else
                return false
            end
        elsif !fresh 
            if (this_grid.x == @x) && (this_grid.y == (@y + 1)) && (target_square == nil)
                return true
            elsif ((target_square != nil) && (this_grid.x == (@x + 1)) && (this_grid.y == (@y + 1)))
                return true
            elsif ((target_square != nil) && (this_grid.x == (@x - 1)) && (this_grid.y == (@y + 1)))
                return true
            else
                return false
            end
        end
    end
end

class Grid
    attr_accessor :h0, :h1, :h2, :h3, :h4, :h5, :h6, :h7, :h8, :grid, :x, :y, :position_logger, :black_logger, :white_logger

    def initialize
        wSquare = "\u25A0"
        wSquare = wSquare.encode('utf-8')
        bSquare = "\u25A1"
        bSquare = bSquare.encode('utf-8')

        @h8 = [" 8 ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " "]
        @h7 = [" 7 ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " "]
        @h6 = [" 6 ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " "]
        @h5 = [" 5 ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " "]
        @h4 = [" 4 ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " "]
        @h3 = [" 3 ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " "]
        @h2 = [" 2 ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " "]
        @h1 = [" 1 ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " "]
        @h0 = ["   ", "a ", "b ", "c ", "d ", "e ", "f ", "g ", "h "]
        @grid = [@h8, @h7, @h6, @h5, @h4, @h3, @h2, @h1, @h0]

        $white_hash = {
            "wp1" => WhitePawn.new(self.grid, 6, 1, "\u265F"),
            "wp2" => WhitePawn.new(self.grid, 6, 2, "\u265F"),
            "wp3" => WhitePawn.new(self.grid, 6, 3, "\u265F"),
            "wp4" => WhitePawn.new(self.grid, 6, 4, "\u265F"),
            "wp5" => WhitePawn.new(self.grid, 6, 5, "\u265F"),
            "wp6" => WhitePawn.new(self.grid, 6, 6, "\u265F"),
            "wp7" => WhitePawn.new(self.grid, 6, 7, "\u265F"),
            "wp8" => WhitePawn.new(self.grid, 6, 8, "\u265F"),
            "wr1" => WhiteRook.new(self.grid, 7, 1, "\u265C"),
            "wr2" => WhiteRook.new(self.grid, 7, 8, "\u265C"),
            "wk1" => WhiteKnight.new(self.grid, 7, 2, "\u265E"),
            "wk2" => WhiteKnight.new(self.grid, 7, 7, "\u265E"),
            "wb1" => WhiteBishop.new(self.grid, 7, 3, "\u265D"),
            "wb2" => WhiteBishop.new(self.grid, 7, 6, "\u265D"),
            "wq" => WhiteQueen.new(self.grid, 7, 4, "\u265B"),
            "wK" => WhiteKing.new(self.grid, 7, 5, "\u265A")
        }

        
        $black_hash = {
            "bp1" => BlackPawn.new(self.grid, 1, 1, "\u2659"),
            "bp2" => BlackPawn.new(self.grid, 1, 2, "\u2659"),
            "bp3" => BlackPawn.new(self.grid, 1, 3, "\u2659"),
            "bp4" => BlackPawn.new(self.grid, 1, 4, "\u2659"),
            "bp5" => BlackPawn.new(self.grid, 1, 5, "\u2659"),
            "bp6" => BlackPawn.new(self.grid, 1, 6, "\u2659"),
            "bp7" => BlackPawn.new(self.grid, 1, 7, "\u2659"),
            "bp8" => BlackPawn.new(self.grid, 1, 8, "\u2659"),
            "br1" => BlackRook.new(self.grid, 0, 1, "\u2656"),
            "br2" => BlackRook.new(self.grid, 0, 8, "\u2656"),
            "bk1" => BlackKnight.new(self.grid, 0, 2, "\u2658"),
            "bk2" => BlackKnight.new(self.grid, 0, 7, "\u2658"),
            "bb1" => BlackBishop.new(self.grid, 0, 3, "\u2657"),
            "bb2" => BlackBishop.new(self.grid, 0, 6, "\u2657"),
            "bq" => BlackQueen.new(self.grid, 0, 4, "\u2655"),
            "bK" => BlackKing.new(self.grid, 0, 5, "\u2654")
        }

        @position_logger = {}
        @black_logger = {}
        @white_logger = {}

    end

    def puts_white_hash
        $white_hash.each do | key, value |
            puts "#{key}: #{value} I'm a #{value.piece}  and I am at #{value.y}, #{value.x}"
        end
    end

    def puts_black_hash
        $black_hash.each do | key, value |
            puts "#{key}: #{value} I'm a #{value.piece}  and I am at #{value.y}, #{value.x}"
        end
    end


    def blank_grid
        wSquare = "\u25A0"
        wSquare = wSquare.encode('utf-8')
        bSquare = "\u25A1"
        bSquare = bSquare.encode('utf-8')
        @h8 = [" 8 ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " "]
        @h7 = [" 7 ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " "]
        @h6 = [" 6 ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " "]
        @h5 = [" 5 ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " "]
        @h4 = [" 4 ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " "]
        @h3 = [" 3 ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " "]
        @h2 = [" 2 ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " "]
        @h1 = [" 1 ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " ", bSquare + " ", wSquare + " "]
        @h0 = ["   ", "a ", "b ", "c ", "d ", "e ", "f ", "g ", "h "]
        @grid = [@h8, @h7, @h6, @h5, @h4, @h3, @h2, @h1, @h0]
    end

    def update_logger
        $white_hash.each do | key, value |
            @position_logger[key] = value
        end
        $black_hash.each do | key, value |
            @position_logger[key] = value
        end
        #puts @position_logger        
    end

    def pick_x(x)
        @x = x

        case @x 
        when "a"
            @x = 1
        when "b"
            @x = 2
        when "c"
            @x = 3
        when "d"
            @x = 4
        when "e"
            @x = 5
        when "f"
            @x = 6
        when "g"
            @x = 7
        when "h"
            @x = 8
        else
            puts "This doesn't fit the criteria!"
        end       
    end

    def pick_y(y)
        @y = y 

        case @y 
        when 1
            @y = 7
        when 2
            @y = 6
        when 3
            @y = 5
        when 4
            @y = 4
        when 5
            @y = 3
        when 6
            @y = 2
        when 7
            @y = 1
        when 8
            @y = 0
        else
            puts "This doesn't fit the criteria!"
        end
    end

    def selector(player_turn)
        if player_turn == "white"
            $white_hash.each do | key, value |
                if (value.y == @y) && (value.x == @x)
                    return value
                end
            end
            return nil
        elsif player_turn == "black"
            $black_hash.each do | key, value |
                if (value.y == @y) && (value.x == @x)
                    return value
                end
            end  
            return nil 
        else
            return nil
        end
    end

    def target(player_turn)
        if player_turn == "white"
            $white_hash.each do | key, value |
                if (value.y == @y) && (value.x == @x)
                    return "yours"
                end
            end
            $black_hash.each do | key, value |
                if (value.y == @y) && (value.x == @x)
                    return key
                end
            end
            return nil
        elsif player_turn == "black"
            $black_hash.each do | key, value |
                if (value.y == @y) && (value.x == @x)
                    return "yours"
                end
            end
            $white_hash.each do | key, value |
                if (value.y == @y) && (value.x == @x)
                    return key
                end
            end
            return nil
        else
            return nil
        end
        
    end
###################################################
###################################################
###################################################
###################################################
###################################################
###################################################
###################################################
###################################################
###################################################
###################################################
    def mover(piece, target_square, player_team, enemy_team, total_log, grid)
        if ((piece.piece == "\u2659") || (piece.piece == "\u265F"))
            moveable = piece.can_move(grid, target_square)
        else
            moveable = piece.can_move(grid)
        end

        if moveable
            piece.y = @y
            piece.x = @x

            if target_square != nil
                enemy_team.delete(target_square)
                total_log.delete(target_square)
            end

            if ((piece.piece == "\u2659") && (piece.y == 7))
                puts ""
                puts "*********************************"
                puts "Black has reached the other side!"
                puts "*********************************"
                player_team.each do | key, value |
                    if (value == piece)
                        temp_key = key
                        temp_y = piece.y 
                        temp_x = piece.x 
                        player_team.delete(target_square)
                        total_log.delete(target_square)
                        puts ""
                        puts "Congratulations!  What would you like to promote your pawn to?"
                        puts "Valid selections are: 'Rook', 'Bishop', 'Knight', 'Queen' "
                        promoted = gets.chomp.downcase
                        while !((promoted == "rook") || (promoted == "bishop") || (promoted == "knight") || (promoted == "queen"))
                            puts ""
                            puts "Invalid selection!  Pick again."
                            puts "Valid selections are: 'Rook', 'Bishop', 'Knight', 'Queen' "
                            promoted = gets.chomp.downcase
                        end
                        if (promoted == "queen")
                            player_team[temp_key] = BlackQueen.new(grid.grid, temp_y, temp_x, "\u2655")
                            total_log[temp_key] = BlackQueen.new(grid.grid, temp_y, temp_x, "\u2655")
                        elsif (promoted == "knight")
                            player_team[temp_key] = BlackKnight.new(grid.grid, temp_y, temp_x, "\u2658")
                            total_log[temp_key] = BlackKnight.new(grid.grid, temp_y, temp_x, "\u2658")
                        elsif (promoted == "bishop")
                            player_team[temp_key] = BlackBishop.new(grid.grid, temp_y, temp_x, "\u2657")
                            total_log[temp_key] = BlackBishop.new(grid.grid, temp_y, temp_x, "\u2657")
                        elsif (promoted == "rook")
                            player_team[temp_key] = BlackRook.new(grid.grid, temp_y, temp_x, "\u2656")
                            total_log[temp_key] = BlackRook.new(grid.grid, temp_y, temp_x, "\u2656")
                        else
                            
                        end
                    end
                end

            elsif ((piece.piece == "\u265F") && (piece.y == 0))
                puts ""
                puts "*********************************"
                puts "White has reached the other side!"
                puts "*********************************"
                player_team.each do | key, value |
                    if (value == piece)
                        temp_key = key
                        temp_y = piece.y 
                        temp_x = piece.x 
                        player_team.delete(target_square)
                        total_log.delete(target_square)
                        puts ""
                        puts "Congratulations!  What would you like to promote your pawn to?"
                        puts "Valid selections are: 'Rook', 'Bishop', 'Knight', 'Queen' "
                        promoted = gets.chomp.downcase
                        while !((promoted == "rook") || (promoted == "bishop") || (promoted == "knight") || (promoted == "queen"))
                            puts ""
                            puts "Invalid selection!  Pick again."
                            puts "Valid selections are: 'Rook', 'Bishop', 'Knight', 'Queen' "
                            promoted = gets.chomp.downcase
                        end
                        if (promoted == "queen")
                            player_team[temp_key] = WhiteQueen.new(grid.grid, temp_y, temp_x, "\u265B")
                            total_log[temp_key] = WhiteQueen.new(grid.grid, temp_y, temp_x, "\u265B")
                        elsif (promoted == "knight")
                            player_team[temp_key] = WhiteKnight.new(grid.grid, temp_y, temp_x, "\u265E")
                            total_log[temp_key] = WhiteKnight.new(grid.grid, temp_y, temp_x, "\u265E")
                        elsif (promoted == "bishop")
                            player_team[temp_key] = WhiteBishop.new(grid.grid, temp_y, temp_x, "\u265D")
                            total_log[temp_key] = WhiteBishop.new(grid.grid, temp_y, temp_x, "\u265D")
                        elsif (promoted == "rook")
                            player_team[temp_key] = WhiteRook.new(grid.grid, temp_y, temp_x, "\u265C")
                            total_log[temp_key] = WhiteRook.new(grid.grid, temp_y, temp_x, "\u265C")
                        else

                        end
                    end
                end
            end

            return true
        else
            puts ""
            puts "\n\n\n"
            puts "********************************************"
            puts "You can't move a #{piece.piece}  like that!  Try again..."
            puts "********************************************"
            puts ""
            puts "\n\n\n\n\n\n"
            grid.draw
            puts "\n\n\n\n\n\n"
            return false
        end
    end

    def draw
        vert_ind = 0
        while vert_ind < 9
            row = grid[vert_ind].join('')
            puts row
            vert_ind += 1
        end
    end

    def apply_logger
        @position_logger.each do | key, value | 
            @grid[value.y][value.x] = "#{value.piece} "
        end
    end

end

class Current
    attr_accessor :i_am
    def initialize
        @i_am = "nothing yet"
    end
    def what_am_i?(counter)
        if (counter % 2 == 0)
            @i_am = "white"
        else
            @i_am = "black"
        end
        i_am
    end
end

class CurrentHash
    attr_accessor :hash, :current_player
    def initialize(grid)
        @hash = nil
        @grid = grid
    end

    def update_hash(current_player)
        if current_player == "white"
            @hash = $white_hash
        elsif current_player == "black"
            @hash = $black_hash
        end
        return @hash
    end
end


class EnemyHash
    attr_accessor :hash, :current_player
    def initialize(grid)
        @hash = nil
        @grid = grid
    end

    def update_hash(current_player)
        if current_player == "white"
            @hash = $black_hash
        elsif current_player == "black"
            @hash = $white_hash
        end
        return @hash
    end
end

puts ""
puts "Let's Play Chess!"
puts ""
my_grid = Grid.new
my_counter = 0
my_grid.draw
puts ""
player = Current.new
my_team = CurrentHash.new(my_grid)
enemy_team = EnemyHash.new(my_grid)
checkmate = false

#puts "Here's what is inside of white_hash!"
#my_grid.puts_white_hash
#puts ""

#puts "Here's what is inside of black_hash!"
#my_grid.puts_black_hash
#puts ""

#puts "Here is the log of piece data..."
#puts ""
#my_grid.update_logger
#puts my_grid.position_logger
#puts ""

while !checkmate
    current_player = player.what_am_i?(my_counter)
    puts "**************************************"
    puts "\n\n\n\n\n\n"
    puts ""
    puts "It is the #{current_player} side's turn!"
    puts ""

    mine = my_team.update_hash(current_player)
    theirs = enemy_team.update_hash(current_player)

    #puts "My team is #{mine}"
    #puts ""
    #puts "Their team is #{theirs}"

    ###############################################################################

    moved = false
    puts "Pick a piece to move, by selecting its row and column."
    puts ""
       
    while (!moved)
        piece_to_move = nil
        moved = false
        puts "What column would you like to pick (a through h)?"
        theX = gets.chomp.downcase
        while !("a".."h").include? theX 
            puts ""
            puts "Invalid input, try entering your column letter again!"
            theX = gets.chomp.downcase
            puts ""
        end
        my_grid.pick_x(theX)

        puts "What row would you like to pick (1 through 8)?"
        theY = gets.chomp.to_i
        while ((theY > 8) || (theY < 1))
            puts ""
            puts "Invalid input, try entering your row number again!"
            theY = gets.chomp.to_i
            puts ""
        end
        my_grid.pick_y(theY) 

        piece_to_move = my_grid.selector(current_player)
        
        if piece_to_move == nil
            puts ""
            puts "\n\n\n\n"
            puts "*************************************************"
            puts "You didn't select one of your pieces!  Try again!"
            puts "*************************************************"
            puts "\n\n\n\n"
            my_grid.draw
            puts "\n\n\n\n"
            puts ""
            next
        end

        puts ""
        puts "Where should I put the #{piece_to_move.piece} ?"
        puts ""

        puts "What column would you like your piece to go (a through h)?"
        theX = gets.chomp.downcase
        while !("a".."h").include? theX 
            puts ""
            puts "Invalid input, try entering your column letter again!"
            theX = gets.chomp.downcase
            puts ""
        end
        my_grid.pick_x(theX)
        a = my_grid.pick_x(theX)

        puts "What row would you like your piece to go (1 through 8)?"
        theY = gets.chomp.to_i
        while ((theY > 8) || (theY < 1))
            puts ""
            puts "Invalid input, try entering your row number again!"
            theY = gets.chomp.to_i
            puts ""
        end
        my_grid.pick_y(theY) 
        b = my_grid.pick_y(theY)

        target_square = my_grid.target(current_player)

        if target_square == "yours"
            puts "You already have a piece there!"
            puts ""
            puts "\n\n\n\n"
            puts "*************************************************"
            puts "You already have a #{my_grid.grid[b][a]} of yours there!  Try again!"
            puts "*************************************************"
            puts "\n\n\n\n"
            my_grid.draw
            puts "\n\n\n\n"
            puts ""
            next
        end

        can_it_move = my_grid.mover(piece_to_move, target_square, mine, theirs, my_grid.position_logger, my_grid)

        if !can_it_move 
            next
        end

        moved = true

        #puts my_grid.position_logger

        puts "\n\n\n"

        my_grid.update_logger
        
        my_grid.blank_grid
        my_grid.apply_logger

        my_grid.draw
        
    end
    
    my_counter += 1
end
