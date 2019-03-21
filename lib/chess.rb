require 'yaml'

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
            $white_hash.each do | key, value|
                if this_grid.grid[@y][(@x + 1)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == @y)
            $white_hash.each do | key, value|
                if this_grid.grid[@y][(@x - 1)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == @x) && (this_grid.y == (@y + 1))
            $white_hash.each do | key, value|
                if this_grid.grid[(@y + 1)][(@x)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == @x) && (this_grid.y == (@y - 1))
            $white_hash.each do | key, value|
                if this_grid.grid[(@y - 1)][(@x)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == (@x + 1)) && (this_grid.y == (@y + 1))
            $white_hash.each do | key, value|
                if this_grid.grid[(@y + 1)][(@x + 1)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == (@x + 1)) && (this_grid.y == (@y - 1))
            $white_hash.each do | key, value|
                if this_grid.grid[(@y - 1)][(@x + 1)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y + 1))
            $white_hash.each do | key, value|
                if this_grid.grid[(@y + 1)][(@x - 1)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y - 1))
            $white_hash.each do | key, value|
                if this_grid.grid[(@y - 1)][(@x - 1)].include? value.piece
                    return false
                end
            end
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
        else
            return false
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
            $black_hash.each do | key, value|
                if this_grid.grid[@y][(@x + 1)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == @y)
            $black_hash.each do | key, value|
                if this_grid.grid[@y][(@x - 1)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == @x) && (this_grid.y == (@y + 1))
            $black_hash.each do | key, value|
                if this_grid.grid[(@y + 1)][(@x)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == @x) && (this_grid.y == (@y - 1))
            $black_hash.each do | key, value|
                if this_grid.grid[(@y - 1)][(@x)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == (@x + 1)) && (this_grid.y == (@y + 1))
            $black_hash.each do | key, value|
                if this_grid.grid[(@y + 1)][(@x + 1)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == (@x + 1)) && (this_grid.y == (@y - 1))
            $black_hash.each do | key, value|
                if this_grid.grid[(@y - 1)][(@x + 1)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y + 1))
            $black_hash.each do | key, value|
                if this_grid.grid[(@y + 1)][(@x - 1)].include? value.piece
                    return false
                end
            end
            return true
        elsif (this_grid.x == (@x - 1)) && (this_grid.y == (@y - 1))
            $black_hash.each do | key, value|
                if this_grid.grid[(@y - 1)][(@x - 1)].include? value.piece
                    return false
                end
            end
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
        else
            return false
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
    attr_accessor :h0, :h1, :h2, :h3, :h4, :h5, :h6, :h7, :h8, :grid, :x, :y, :position_logger, :black_logger, :white_logger, :white_check, :black_check, :my_counter, :bot_color

    def initialize
        wSquare = "\u25A0"
        wSquare = wSquare.encode('utf-8')
        bSquare = "\u25A1"
        bSquare = bSquare.encode('utf-8')
        @white_check = nil
        @black_check = nil
        @my_counter = 0
        @bot_color = nil

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

    def mover(piece, target_square, player_team, enemy_team, total_log, grid, current_player)
        
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

################### see if enemy king is in check ######################
            if current_player == "white"

                grid_holder_x = @x 
                grid_holder_y = @y 

                king = $black_hash["bK"]
                @x = king.x 
                @y = king.y 

                if (piece.piece == "\u265F")
                    if (king.y == (piece.y - 1)) && ((king.x == (piece.x - 1)) || (king.x == (piece.x + 1)))
                        put_king_in_check = piece.can_move(grid, target_square)
                    else
                        put_king_in_check = false
                    end
                else
                    put_king_in_check = piece.can_move(grid)
                end

                if put_king_in_check
                    @black_check = piece
                end

            elsif current_player == "black"

                grid_holder_x = @x 
                grid_holder_y = @y 

                king = $white_hash["wK"]
                @x = king.x 
                @y = king.y 

                if (piece.piece == "\u2659")
                    if (king.y == (piece.y + 1)) && ((king.x == (piece.x - 1)) || (king.x == (piece.x + 1)))
                        put_king_in_check = piece.can_move(grid, target_square)
                    else
                        put_king_in_check = false
                    end
                else
                    put_king_in_check = piece.can_move(grid)
                end

                if put_king_in_check
                    @white_check = piece
                end 

            end

            return true
        else
            if current_player != @bot_color
                puts ""
                puts "\n\n\n"
                puts "********************************************"
                puts "You can't move a #{piece.piece}  like that!  Try again..."
                puts "********************************************"
                puts ""
                puts "\n\n\n\n\n\n"
                grid.draw
                puts "\n\n\n\n\n\n"
            end
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

    def save_game
        data = []
        data[0] = @my_counter
        data[1] = @white_check
        data[2] = @black_check
        data[3] = $white_hash
        data[4] = $black_hash
        data[5] = @bot_color
        yaml_data = YAML::dump(data)
        File.open('chess_data.yaml', 'w') { |file| file.write yaml_data }
        puts "Your game has saved!  Come back to finish it sometime!"
        exit
    end

    def load_game
        puts ""
        puts "I'll load it for you..."
        puts ""
        yaml_data = YAML::load_file('chess_data.yaml')
        @my_counter = yaml_data[0]
        @white_check = yaml_data[1]
        @black_check = yaml_data[2]
        $white_hash = yaml_data[3]
        $black_hash = yaml_data[4]
        @bot_color = yaml_data[5]
    end

    def bot_color_holder(bot_color)
        @bot_color = bot_color
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

class Checkchecker
    def check(grid, enemy_team, target_square)
        enemy_team.each do | key, value |
            if enemy_team == $white_hash
                king = $black_hash["bK"]
            elsif enemy_team == $black_hash
                king = $white_hash["wK"]
            end

            grid.x = king.x 
            grid.y = king.y 

            if (value.piece == "\u265F") #white pawn
                if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                    can_capture_king = true
                else
                    next
                end
            elsif (value.piece == "\u2659") #black pawn
                if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                    can_capture_king = true
                else
                    next
                end
            else
                can_capture_king = value.can_move(grid)
            end

            if can_capture_king
                return true
            end
        end
        return false
    end
end

class BlockCheck
    def block(current_player, grid, my_team)
        if ((current_player == "white") && (grid.white_check))
            king = $white_hash["wK"]
            king_x = king.x 
            king_y = king.y
            offender = grid.white_check
            off_x = offender.x 
            off_y = offender.y 

        elsif ((current_player == "black") && (grid.black_check))
            king = $black_hash["bK"]
            king_x = king.x 
            king_y = king.y
            offender = grid.black_check
            off_x = offender.x 
            off_y = offender.y 
        end

        target_square = grid.target(current_player)

        diff_x = king_x - off_x
        diff_y = king_y - off_y

        if diff_x < 0
            abs_x = -1 * diff_x
        else
            abs_x = diff_x
        end

        if diff_y < 0
            abs_y = -1 * diff_y
        else
            abs_y = diff_y
        end

        if (diff_x == 0)
            if (diff_y > 0)
                max = king_y
                min = off_y

                index = min

                while index < max
                    my_team.each do | key, value |
                        grid.x = king_x
                        grid.y = index
                        if ((value.piece == "\u2654") || (value.piece == "\u265A"))
                            next
                        end
                        if (value.piece == "\u265F") #white pawn
                            if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                                moveable = true
                            else
                                next
                            end
                        elsif (value.piece == "\u2659") #black pawn
                            if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                                moveable = true
                            else
                                next
                            end
                        else
                            moveable = value.can_move(grid)
                        end
                        if moveable
                            return true
                        end
                    end
                    index += 1
                end
                return false

            else
                max = off_y
                min = king_y

                index = max

                while index > min
                    my_team.each do | key, value |
                        grid.x = king_x
                        grid.y = index
                        if ((value.piece == "\u2654") || (value.piece == "\u265A"))
                            next
                        end
                        if (value.piece == "\u265F") #white pawn
                            if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                                moveable = true
                            else
                                next
                            end
                        elsif (value.piece == "\u2659") #black pawn
                            if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                                moveable = true
                            else
                                next
                            end
                        else
                            moveable = value.can_move(grid)
                        end
                        if moveable
                            return true
                        end
                    end
                    index -= 1
                end
                return false

            end

        elsif (diff_y == 0)
            if (diff_x > 0)
                max = king_x
                min = off_x

                index = min

                while index < max
                    my_team.each do | key, value |
                        grid.x = index
                        grid.y = king_y
                        if ((value.piece == "\u2654") || (value.piece == "\u265A"))
                            next
                        end
                        if (value.piece == "\u265F") #white pawn
                            if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                                moveable = true
                            else
                                next
                            end
                        elsif (value.piece == "\u2659") #black pawn
                            if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                                moveable = true
                            else
                                next
                            end
                        else
                            moveable = value.can_move(grid)
                        end
                        if moveable
                            return true
                        end
                    end
                    index += 1
                end
                return false

            else
                max = off_x
                min = king_x

                index = max

                while index > min
                    my_team.each do | key, value |
                        grid.x = index
                        grid.y = king_y
                        if ((value.piece == "\u2654") || (value.piece == "\u265A"))
                            next
                        end
                        if (value.piece == "\u265F") #white pawn
                            if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                                moveable = true
                            else
                                next
                            end
                        elsif (value.piece == "\u2659") #black pawn
                            if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                                moveable = true
                            else
                                next
                            end
                        else
                            moveable = value.can_move(grid)
                        end
                        if moveable
                            return true
                        end
                    end
                    index -= 1
                end
                return false

            end

        elsif (abs_x == abs_y) && (diff_x > 0) && (diff_y > 0) 
            max_x = king_x
            min_x = off_x
            max_y = king_y
            min_y = off_y

            index_x = min_x
            index_y = min_y

            while index_x < max_x
                my_team.each do | key, value |
                    grid.x = index_x
                    grid.y = index_y
                    if ((value.piece == "\u2654") || (value.piece == "\u265A"))
                        next
                    end
                    if (value.piece == "\u265F") #white pawn
                        if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                            moveable = true
                        else
                            next
                        end
                    elsif (value.piece == "\u2659") #black pawn
                        if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                            moveable = true
                        else
                            next
                        end
                    else
                        moveable = value.can_move(grid)
                    end
                    if moveable
                        return true
                    end
                end
                index_x += 1
                index_y += 1
            end
            return false
        elsif (abs_x == abs_y) && (diff_x < 0) && (diff_y > 0) 
            max_x = off_x
            min_x = king_x
            max_y = king_y
            min_y = off_y

            index_x = max_x
            index_y = min_y

            while index_x > min_x
                my_team.each do | key, value |
                    grid.x = index_x
                    grid.y = index_y
                    if ((value.piece == "\u2654") || (value.piece == "\u265A"))
                        next
                    end
                    if (value.piece == "\u265F") #white pawn
                        if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                            moveable = true
                        else
                            next
                        end
                    elsif (value.piece == "\u2659") #black pawn
                        if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                            moveable = true
                        else
                            next
                        end
                    else
                        moveable = value.can_move(grid)
                    end
                    if moveable
                        return true
                    end
                end
                index_x -= 1
                index_y += 1
            end
            return false
        elsif (abs_x == abs_y) && (diff_x > 0) && (diff_y < 0) 
            max_x = king_x
            min_x = off_x
            max_y = off_y
            min_y = king_y

            index_x = min_x
            index_y = max_y

            while index_x < max_x
                my_team.each do | key, value |
                    grid.x = index_x
                    grid.y = index_y
                    if ((value.piece == "\u2654") || (value.piece == "\u265A"))
                        next
                    end
                    if (value.piece == "\u265F") #white pawn
                        if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                            moveable = true
                        else
                            next
                        end
                    elsif (value.piece == "\u2659") #black pawn
                        if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                            moveable = true
                        else
                            next
                        end
                    else
                        moveable = value.can_move(grid)
                    end
                    if moveable
                        return true
                    end
                end
                index_x += 1
                index_y -= 1
            end
            return false
        elsif (abs_x == abs_y) && (diff_x < 0) && (diff_y < 0) 
            max_x = off_x
            min_x = king_x
            max_y = off_y
            min_y = king_y

            index_x = max_x
            index_y = max_y

            while index_x > min_x
                my_team.each do | key, value |
                    grid.x = index_x
                    grid.y = index_y
                    if ((value.piece == "\u2654") || (value.piece == "\u265A"))
                        next
                    end
                    if (value.piece == "\u265F") #white pawn
                        if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                            moveable = true
                        else
                            next
                        end
                    elsif (value.piece == "\u2659") #black pawn
                        if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                            moveable = true
                        else
                            next
                        end
                    else
                        moveable = value.can_move(grid)
                    end
                    if moveable
                        return true
                    end
                end
                index_x -= 1
                index_y -= 1
            end
            return false
        else
            return false
        end
    end
end

class CaptureOffender
    def can_capture(current_player, grid, my_team, target_square)

        if current_player == "white"
            target = grid.white_check
            king = $white_hash["wK"]
            enemy_team = $black_hash
        elsif current_player == "black"
            target = grid.black_check
            king = $black_hash["bK"]
            enemy_team = $white_hash
        end

        flag = nil
        number_who_can_capture = 0

        grid.x = target.x 
        grid.y = target.y 

        my_team.each do | key, value |
            if (value.piece == "\u265F") #white pawn
                if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                    number_who_can_capture += 1
                else
                    next
                end
            elsif (value.piece == "\u2659") #black pawn
                if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                    number_who_can_capture += 1
                else
                    next
                end
            elsif ((value.piece == "\u2654") || (value.piece == "\u265A"))
                take_offender = value.can_move(grid)
                if take_offender
                    flag = true
                end
            else
                take_offender = value.can_move(grid)
                if take_offender
                    number_who_can_capture += 1
                end
            end        
        end
        if (number_who_can_capture != 0)
            return true
        elsif (number_who_can_capture == 0) && (flag != nil)
            temp_key = nil
            temp_value = nil
            enemy_team.each do | key, value |
                if value == target
                    temp_value = value
                    temp_key = key
                end
            end
            enemy_team.delete_if{| key, value | value == target}
            grid.position_logger.delete_if{| key, value | value == target}
            temp_x = king.x 
            temp_y = king.y 

            king.x = grid.x
            king.y = grid.y 

            grid.update_logger
            flag2 = nil

            enemy_team.each do | key, value |
                if (value.piece == "\u265F") && (flag2 == nil) #white pawn
                    if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                        flag2 = true
                    else
                        next
                    end
                elsif (value.piece == "\u2659") && (flag2 == nil) #black pawn
                    if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                        flag2 = true
                    else
                        next
                    end
                elsif (flag2 == nil)
                    take_offender = value.can_move(grid)
                    if take_offender
                        flag2 = true
                    end
                end
            end
            if flag2 != nil
                king.x = temp_x
                king.y = temp_y
                enemy_team[temp_key] = temp_value
                grid.position_logger[temp_key] = temp_value
                grid.update_logger
                return false
            end
            return true
        else
            return false
        end
    end
end

class KingSurvey
    def survey(shift_x, shift_y, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
        my_grid.x = (king_x + shift_x)
        my_grid.y = (king_y + shift_y)
        attempt = king.can_move(my_grid)

        if attempt && $done
            still_in_check = true
            bring_back_key = nil
            bring_back_value = nil
            target_square = my_grid.target(current_player)

            if target_square != nil
                if current_player == "white"
                    $black_hash.each do | key, value |
                        if key.include? target_square
                            bring_back_key = target_square
                            bring_back_value = value
                        end
                    end
                elsif current_player == "black"
                    $white_hash.each do | key, value |
                        if key.include? target_square
                            bring_back_key = target_square
                            bring_back_value = value
                        end
                    end
                end
            end

            king_move = my_grid.mover(king, target_square, mine, theirs, my_grid.position_logger, my_grid, current_player)

            if king_move
                my_grid.blank_grid 
                my_grid.update_logger
                my_grid.apply_logger
                still_in_check = checker.check(my_grid, theirs, target_square)
            end

            king.x = king_x
            king.y = king_y
            if bring_back_key != nil
                theirs[bring_back_key] = bring_back_value
                my_grid.position_logger[bring_back_key] = bring_back_value
            end
            my_grid.blank_grid 
            my_grid.update_logger
            my_grid.apply_logger
            if !still_in_check
                $done = false
            end
        end

    end
end

class SweepingSurvey
    def sweep(surveyor, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker, capture_offender, blocker)
        if king_y == 0 && ((king_x != 1 && king_x != 8))
            $done = true

            target_square = my_grid.target(current_player)
            capture_able = capture_offender.can_capture(current_player, my_grid, mine, target_square)
            if capture_able
                $done = false
            end

            blockable = blocker.block(current_player, my_grid, mine) 
            if blockable
                $done = false
            end

            surveyor.survey(1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(-1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(1, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(-1, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)

            if $done
                $checkmate = true
            end

        elsif king_y == 7 && ((king_x != 1 && king_x != 8))
            $done = true
            target_square = my_grid.target(current_player)
            capture_able = capture_offender.can_capture(current_player, my_grid, mine, target_square)
            if capture_able
                $done = false
            end

            blockable = blocker.block(current_player, my_grid, mine) 
            if blockable
                $done = false
            end

            surveyor.survey(1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(-1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(1, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(-1, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)

            if $done
                $checkmate = true
            end
        elsif ((king_y != 0 && king_y != 7)) && king_x == 1

            $done = true

            target_square = my_grid.target(current_player)
            capture_able = capture_offender.can_capture(current_player, my_grid, mine, target_square)
            if capture_able
                $done = false
            end

            blockable = blocker.block(current_player, my_grid, mine) 
            if blockable
                $done = false
            end

            surveyor.survey(1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(1, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(1, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)

            if $done
                $checkmate = true
            end
            
        elsif ((king_y != 0 && king_y != 7)) && king_x == 8

            $done = true

            target_square = my_grid.target(current_player)
            capture_able = capture_offender.can_capture(current_player, my_grid, mine, target_square)
            if capture_able
                $done = false
            end

            blockable = blocker.block(current_player, my_grid, mine) 
            if blockable
                $done = false
            end

            surveyor.survey(-1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(-1, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(-1, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)

            if $done
                $checkmate = true
            end

        elsif king_y == 0 && king_x == 1

            $done = true

            target_square = my_grid.target(current_player)
            capture_able = capture_offender.can_capture(current_player, my_grid, mine, target_square)
            if capture_able
                $done = false
            end

            blockable = blocker.block(current_player, my_grid, mine) 
            if blockable
                $done = false
            end

            surveyor.survey(1, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)

            if $done
                $checkmate = true
            end

        elsif king_y == 0 && king_x == 8

            $done = true

            target_square = my_grid.target(current_player)
            capture_able = capture_offender.can_capture(current_player, my_grid, mine, target_square)
            if capture_able
                $done = false
            end

            blockable = blocker.block(current_player, my_grid, mine) 
            if blockable
                $done = false
            end

            surveyor.survey(-1, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(-1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)

            if $done
                $checkmate = true
            end

        elsif king_y == 7 && king_x == 1

            $done = true

            target_square = my_grid.target(current_player)
            capture_able = capture_offender.can_capture(current_player, my_grid, mine, target_square)
            if capture_able
                $done = false
            end

            blockable = blocker.block(current_player, my_grid, mine) 
            if blockable
                $done = false
            end

            surveyor.survey(1, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)

            if $done
                $checkmate = true
            end

        elsif king_y == 7 && king_x == 8

            $done = true

            target_square = my_grid.target(current_player)
            capture_able = capture_offender.can_capture(current_player, my_grid, mine, target_square)
            if capture_able
                $done = false
            end

            blockable = blocker.block(current_player, my_grid, mine) 
            if blockable
                $done = false
            end

            surveyor.survey(-1, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(-1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)

            if $done
                $checkmate = true
            end

        else

            $done = true

            target_square = my_grid.target(current_player)
            capture_able = capture_offender.can_capture(current_player, my_grid, mine, target_square)
            if capture_able
                $done = false
            end

            blockable = blocker.block(current_player, my_grid, mine) 
            if blockable
                $done = false
            end

            surveyor.survey(1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(-1, 0, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(0, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(1, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(-1, 1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(1, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)
            surveyor.survey(-1, -1, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker)

            if $done
                $checkmate = true
            end

        end
    end
end

class ArtificialIntelligence
    attr_accessor :side, :old_x, :old_y, :bring_back_key, :bring_back_value, :picked_piece
    def initialize
        @side = nil
        @old_x = nil
        @old_y = nil
        @bring_back_key = nil
        @bring_back_value = nil
        @picked_piece = nil
    end

    def which_side(side)
        @side = side
    end

    def move(piece_to_move, target_square, mine, theirs, my_grid, current_player)
        team = nil
        if side == "white"
            team = $white_hash
        elsif side == "black"
            team = $black_hash
        end

        moved = false

        while !moved
            random_key = team.keys.sample
            random_piece = team[random_key]
            @picked_piece = random_piece
            @old_x = random_piece.x 
            @old_y = random_piece.y
            random_x = (rand(8) + 1)
            random_y = rand(8)
            
            my_grid.x = random_x
            my_grid.y = random_y
            target_square = my_grid.target(current_player)
            if target_square == "yours"
                next
            end
            @bring_back_key = nil
            @bring_back_value = nil
    
            if target_square != nil
                if @side == "white"
                    $black_hash.each do | key, value |
                        if key.include? target_square
                            @bring_back_key = target_square
                            @bring_back_value = value
                        end
                    end
                elsif @side == "black"
                    $white_hash.each do | key, value |
                        if key.include? target_square
                            @bring_back_key = target_square
                            @bring_back_value = value
                        end
                    end
                end
            end

            can_it_move = my_grid.mover(random_piece, target_square, mine, theirs, my_grid.position_logger, my_grid, current_player)
            
            if can_it_move
                moved = true
            end
        end
    end
end

puts ""
puts "Let's Play Chess!"
puts ""
my_grid = Grid.new
player = Current.new
my_team = CurrentHash.new(my_grid)
enemy_team = EnemyHash.new(my_grid)
$checkmate = false
checker = Checkchecker.new
blocker = BlockCheck.new
capture_offender = CaptureOffender.new
surveyor = KingSurvey.new
$done = nil
player_passer = nil
sweeper = SweepingSurvey.new
bot = ArtificialIntelligence.new

if File.file?('chess_data.yaml')
    puts "You have a game in progress.  Would you like to resume this game (yes / no)?"
    puts "If you type no, then I'll erase the old game data!"
    puts ""
    choice = gets.chomp.downcase
    while !(choice == "yes" || choice == "no")
        puts "Invalid input, try again!  Would you like to resume this game (yes / no)?"
        choice = gets.chomp.downcase
    end
    if choice == "yes"
        my_grid.load_game
        if my_grid.bot_color != nil
            if my_grid.bot_color == "white"
                bot.which_side("white")
            elsif my_grid.bot_color == "black"
                bot.which_side("black")
            end
        end
        my_grid.update_logger
        my_grid.blank_grid
        my_grid.apply_logger
    elsif choice == "no"
        File.delete('chess_data.yaml')
    end
end
if !File.file?('chess_data.yaml')
    puts ""
    puts "Do you want to play against the computer or are there two of you?"
    puts "Type 'yes' for computer or 'no' for two human players."
    choice2 = gets.chomp.downcase
    while !(choice2 == "yes" || choice2 == "no")
        puts ""
        puts "Invalid input, try again!  Would you like to play against a computer? (yes / no)"
        choice2 = gets.chomp.downcase
    end
    if choice2 == "yes"
        puts "Which team do you want to be?  (white / black)"
        choice3 = gets.chomp.downcase
        while !(choice3 == "white" || choice3 == "black")
            puts ""
            puts "Invalid input, try again!  Which team do you want to be?  (white / black)"
            choice3 = gets.chomp.downcase
        end 
        if choice3 == "white"
            puts ""
            puts "Okay, you're the white side!"
            puts ""
            bot.which_side("black") 
            my_grid.bot_color_holder("black")
        elsif choice3 == "black"
            puts ""
            puts "Okay, you're the black side!"
            puts ""
            bot.which_side("white")
            my_grid.bot_color_holder("white")
        end
    end
end
puts ""
my_grid.draw
puts ""

while !$checkmate
    current_player = player.what_am_i?(my_grid.my_counter)
    player_passer = current_player
    puts "**************************************"
    puts "\n\n\n\n\n\n"
    puts ""
    puts "It is the #{current_player} side's turn!"
    puts ""

    mine = my_team.update_hash(current_player)
    theirs = enemy_team.update_hash(current_player)

    #Recognize if pawn gets promoted and puts king in check...


    if (current_player == "white") && !(my_grid.white_check)
        promoted_piece = nil
        can_capture_king = false

        theirs.each do | key, value |
            king = $white_hash["wK"]
            my_grid.x = king.x 
            my_grid.y = king.y
            target_square = my_grid.target(current_player)
            if (value.piece == "\u2659") && !can_capture_king #black pawn
                if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                    promoted_piece = value
                    can_capture_king = true
                else
                    next
                end
            elsif !can_capture_king
                can_capture_king = value.can_move(my_grid)
                if can_capture_king
                    promoted_piece = value
                    can_capture_king = true
                end
            end
            
            if can_capture_king
                my_grid.white_check = promoted_piece
                break
            end
        end
    end

    if (current_player == "black") && !(my_grid.black_check)
        promoted_piece = nil
        can_capture_king = false

        theirs.each do | key, value |
            king = $black_hash["bK"]
            my_grid.x = king.x 
            my_grid.y = king.y
            target_square = my_grid.target(current_player)
            if (value.piece == "\u265F") && !can_capture_king #white pawn
                if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                    promoted_piece = value
                    can_capture_king = true
                else
                    next
                end
            elsif !can_capture_king
                can_capture_king = value.can_move(my_grid)
                if can_capture_king
                    promoted_piece = value
                    can_capture_king = true
                end
            end
            
            if can_capture_king
                my_grid.black_check = promoted_piece
                break
            end
        end
    end


    if ((current_player == "white") && (my_grid.white_check))
        king = $white_hash["wK"]
        king_x = king.x 
        king_y = king.y

        target_square = my_grid.target(current_player)
        sweeper.sweep(surveyor, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker, capture_offender, blocker)

        if $checkmate
            break
        end
        
        puts "\n\n\n"
        puts "******************"
        puts "White is in check!"
        puts "******************"
        puts ""
        puts "The offending piece is #{my_grid.white_check.piece}"
        puts "\n\n\n\n"

    elsif ((current_player == "black") && (my_grid.black_check))
        king = $black_hash["bK"]
        king_x = king.x 
        king_y = king.y

        target_square = my_grid.target(current_player)
        sweeper.sweep(surveyor, king, king_x, king_y, target_square, mine, theirs, my_grid, current_player, checker, capture_offender, blocker)

        if $checkmate
            break
        end
        
        puts "\n\n\n"
        puts "******************"
        puts "Black is in check!"
        puts "******************"
        puts ""
        puts "The offending piece is #{my_grid.black_check.piece}"
        puts "\n\n\n\n"
    end

    moved = false
       
    while (!moved)
        ##########
        ##########
        ##########
        ##########
        ##########

        if bot.side != current_player
            piece_to_move = nil
            moved = false
    
            puts ""
            puts "Pick a piece to move, by selecting its row and column."
            puts "Or type 'save' to save your progress & come back to the game later..."
            puts ""
    
            puts "What column would you like to pick (a through h)?"
            theX = gets.chomp.downcase
            if theX == "save"
                puts "Saving!"
                my_grid.save_game
            end
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
    
            old_x = piece_to_move.x 
            old_y = piece_to_move.y
    
            puts "What column would you like your #{piece_to_move.piece}  to go (a through h)?"
            theX = gets.chomp.downcase
            while !("a".."h").include? theX 
                puts ""
                puts "Invalid input, try entering your column letter again!"
                theX = gets.chomp.downcase
                puts ""
            end
            my_grid.pick_x(theX)
            a = my_grid.pick_x(theX)
    
            puts "What row would you like your #{piece_to_move.piece}  to go (1 through 8)?"
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
    
            bring_back_key = nil
            bring_back_value = nil
    
            if target_square != nil
                if current_player == "white"
                    $black_hash.each do | key, value |
                        if key.include? target_square
                            bring_back_key = target_square
                            bring_back_value = value
                        end
                    end
                elsif current_player == "black"
                    $white_hash.each do | key, value |
                        if key.include? target_square
                            bring_back_key = target_square
                            bring_back_value = value
                        end
                    end
                end
            end
    
            can_it_move = my_grid.mover(piece_to_move, target_square, mine, theirs, my_grid.position_logger, my_grid, current_player)
    
            if !can_it_move 
                next
            end

        elsif bot.side == current_player
            bot.move(nil, nil, mine, theirs, my_grid, current_player)
            old_x = bot.old_x
            old_y = bot.old_y
            bring_back_key = bot.bring_back_key
            bring_back_value = bot.bring_back_value
        end

        ###############
        ###############
        ###############
        ###############
        ###############

        puts "\n\n\n"

        my_grid.update_logger

        my_grid.blank_grid
        my_grid.apply_logger

        if ((current_player == "white") && my_grid.white_check)
            who_in_check = my_grid.white_check
        elsif ((current_player == "black") && my_grid.black_check)
            who_in_check = my_grid.black_check
        else
            who_in_check = nil
        end

        if (who_in_check == nil)
            if (current_player == "white")
                king = $white_hash["wK"]
            elsif (current_player == "black")
                king = $black_hash["bK"]
            end

            flag_key = nil
            flag_value = nil

            my_grid.x = king.x 
            my_grid.y = king.y 
            time_to_break = false
            theirs.each do | key, value |
                if (value.piece == "\u265F") && !time_to_break #white pawn
                    if (king.y == (value.y - 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                        can_capture_king = true
                    else
                        next
                    end
                elsif (value.piece == "\u2659") && !time_to_break #black pawn
                    if (king.y == (value.y + 1)) && ((king.x == (value.x - 1)) || (king.x == (value.x + 1)))
                        can_capture_king = true
                    else
                        next
                    end
                elsif !time_to_break
                    can_capture_king = value.can_move(my_grid)
                end

                if (can_capture_king && !time_to_break)
                    if bring_back_key != nil
                        if !theirs.key?(bring_back_key)
                            flag_key = bring_back_value
                            flag_value = bring_back_value
                        end
                    end

                    time_to_break = true
                end
            end
            if time_to_break

                if flag_key != nil
                    theirs[bring_back_key] = flag_key
                    my_grid.position_logger[bring_back_key] = flag_value
                end

                my_grid.blank_grid
                if bot.side != current_player
                    piece_to_move.x = old_x
                    piece_to_move.y = old_y
                elsif bot.side == current_player
                    bot.picked_piece.x = bot.old_x
                    bot.picked_piece.y = bot.old_y
                end
                my_grid.update_logger
                my_grid.apply_logger
                if bot.side != current_player
                    puts ""
                    puts "\n\n\n"
                    puts "***************************************************"
                    puts "That move would put you in check, please try again!"
                    puts "***************************************************"
                    puts ""
                    puts "\n\n\n\n\n\n"
                    my_grid.draw
                    puts "\n\n\n\n"
                end
                next
            end
        end

        still_in_check_two = checker.check(my_grid, theirs, target_square)
        if (still_in_check_two && (who_in_check != nil))
            if bring_back_key != nil
                theirs[bring_back_key] = bring_back_value
                my_grid.position_logger[bring_back_key] = bring_back_value
            end
            my_grid.blank_grid
            if bot.side != current_player
                piece_to_move.x = old_x
                piece_to_move.y = old_y
            elsif bot.side == current_player
                bot.picked_piece.x = bot.old_x
                bot.picked_piece.y = bot.old_y
            end
            my_grid.update_logger
            my_grid.apply_logger
            if bot.side != current_player
                puts "\n\n\n\n"
                puts "*************************************************"
                puts "That move won't take you out of check, try again!"
                puts "*************************************************"
                puts "\n\n\n\n"
                my_grid.draw
                puts "\n\n\n\n"
            end
            next
        end

    if current_player == bot.side
        puts ""
        puts "Computer is thinking"
        puts ""
        sleep(0.5)
        print "."
        sleep(0.5)
        print "."
        sleep(0.5)
        print "."
        sleep(0.5)
        print "."
        sleep(0.5)
        print "."
        sleep(0.5)
        puts ""
        puts ""
        puts "Aha!  Here's my move!"
        puts ""
        puts ""
        puts ""
    end
        
        my_grid.blank_grid
        my_grid.apply_logger

        my_grid.draw

        #End being in check...
        if (current_player == "white")
            my_grid.white_check = nil
        elsif (current_player == "black")
            my_grid.black_check = nil
        end

        moved = true
        
    end
    
    my_grid.my_counter += 1
end

if player_passer == "black"
    puts "But the black team doesn't have any legal moves left!"
    puts "\n\n\n\n"
    puts "*************************"
    puts "Checkmate!  White wins!!!"
    puts "*************************"
    puts "\n\n\n\n"
    if File.file?('chess_data.yaml')
        File.delete('chess_data.yaml')
    end
elsif player_passer == "white"
    puts "But the white team doesn't have any legal moves left!"
    puts "\n\n\n\n"
    puts "*************************"
    puts "Checkmate!  Black wins!!!"
    puts "*************************"
    puts "\n\n\n\n"
    if File.file?('chess_data.yaml')
        File.delete('chess_data.yaml')
    end
end


